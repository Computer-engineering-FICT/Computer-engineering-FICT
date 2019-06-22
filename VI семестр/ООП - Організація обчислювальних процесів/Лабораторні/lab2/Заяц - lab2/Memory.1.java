package allocator2;

import java.util.ArrayList;
import java.util.List;

public class Memory {

	public static final int MEMORY_SIZE = 1024;

	private static final int ADDITIONAL_SIZE = 16;

	private int[] memory = new int[MEMORY_SIZE + ADDITIONAL_SIZE];

	public static final int[] BLOCK_SIZES = { 8, 16, 32 };

	public static final int PAGE_SIZE = 128;

	public static final int PAGE_COUNT = MEMORY_SIZE / PAGE_SIZE;

	private int[] pageHelper = new int[PAGE_COUNT];

	private int[] busyCount = new int[PAGE_COUNT];

	public static final int FREE_PAGE = 0;

	public static final int BLOCK_PAGE = 1;

	public static final int MULTI_PAGE = 2;

	public static final int PAGE_HEADER_SIZE = 4;

	/**
	 * contains predefined block sizes as keys and list of certain pages with
	 * appropriate block sizes;
	 */
	// private Map<Integer, List<Integer>> pageMap;
	private List<ArrayList<Integer>> pageMap;

	/**
	 * contains list of pages with information about free blocks of appropriate
	 * size;
	 */
	// private List<TreeSet<Integer>> pagesDescription;
	private List<ArrayList<Integer>> pagesDescription;

	public static final int NULL = -1;

	public Memory() {
		pageMap = new ArrayList<ArrayList<Integer>>(BLOCK_SIZES.length);
		for (int i : BLOCK_SIZES)
			pageMap.add(new ArrayList<Integer>());
		pagesDescription = new ArrayList<ArrayList<Integer>>(PAGE_COUNT);
		for (int i = 0; i < PAGE_COUNT; i++)
			pagesDescription.add(new ArrayList<Integer>());
	}

	private int getBlockSize(int size) {
		return size / BLOCK_SIZES[0];
	}

	public int memAlloc(int size) {
		if (size <= 0)
			return NULL;
		int blockSize = getBlockSize(size);
		// search for good block size type
		if (size < BLOCK_SIZES.length) { // if found
			List<Integer> availablePages = pageMap.get(blockSize);
			if (availablePages.size() == 0) { // if there are no page with free
												// blocks
												// of required size
				return createNewPageForBlocks(blockSize);
			} else {
				int result = pagesDescription.get(availablePages.get(0))
						.remove(0);
				busyCount[availablePages.get(0)]++;
				pageHelper[availablePages.get(0)] = blockSize;
				if (pagesDescription.get(availablePages.get(0)).size() == 0)
					pageMap.get(blockSize).remove(0);
				return result;
			}

		}
		// }
		// if we need to allocate 1 or more pages
		int result = findPageForLargeBlock(size);
		if (result == NULL)
			return result;
		int pageCountRequired = size / PAGE_SIZE + 1;
		memory[result + MEMORY_SIZE] = MULTI_PAGE;
		memory[result + MEMORY_SIZE + PAGE_COUNT] = pageCountRequired;
		return result;
	}

	/**
	 * find free block and return its index
	 * 
	 * @return
	 */
	private int findFreePageIndex() {
		for (int i = MEMORY_SIZE; i < MEMORY_SIZE + PAGE_COUNT; i++)
			if (memory[i] == FREE_PAGE)
				return (i - MEMORY_SIZE);
		return NULL;
	}

	private int nextPage(int currentPos) {
		int additionalSize = 0;
		if (memory[currentPos] == MULTI_PAGE)
			additionalSize = PAGE_SIZE * (memory[currentPos + 1] - 1);
		return currentPos += PAGE_SIZE + additionalSize;
	}

	private void markPageAsBlockBusy(int pageIndex, int blockSizeIndex) {
		memory[MEMORY_SIZE + pageIndex] = BLOCK_PAGE;
		int n = PAGE_SIZE / BLOCK_SIZES[blockSizeIndex];
		int pageAddress = pageIndex * PAGE_SIZE;
		for (int i = 0; i < n; i++) {
			pagesDescription.get(pageIndex).add(
					pageAddress + BLOCK_SIZES[blockSizeIndex] * i);
		}
	}

	private int getPageIndex(int pageAddress) {
		return pageAddress / PAGE_SIZE;
	}

	private int createNewPageForBlocks(int blockSize) {
		int pageIndex = findFreePageIndex(); // find free page to
		// allocate
		if (pageIndex == NULL)
			return NULL;
		markPageAsBlockBusy(pageIndex, blockSize);
		pageMap.get(blockSize).add(pageIndex);
		int result = pagesDescription.get(pageIndex).remove(0);
		return result;
	}

	/**
	 * find free space for multipage block
	 * 
	 * @param largeBlockSize
	 * @return index of page which will be start of block
	 */
	private int findPageForLargeBlock(int largeBlockSize) {
		int startPos = MEMORY_SIZE;
		int tmpSize = 0;
		for (int i = MEMORY_SIZE; i < MEMORY_SIZE + PAGE_COUNT; i++) {
			if (memory[i] == FREE_PAGE) {
				tmpSize += PAGE_SIZE;
				if (tmpSize >= largeBlockSize) {
					return startPos - MEMORY_SIZE;
				}
			} else {
				startPos = ++i;
				tmpSize = 0;
			}
		}
		startPos -= MEMORY_SIZE;
		return (startPos < PAGE_COUNT && tmpSize >= largeBlockSize) ? startPos
				: NULL;
	}

	public void memFree(int address) {
		if (address <= 0)
			return;
		int pageIndex = getPageIndex(address);
		int headerAddress = MEMORY_SIZE + pageIndex;
		switch (memory[headerAddress]) {
		case MULTI_PAGE:
			memory[headerAddress] = FREE_PAGE;
			break;
		case BLOCK_PAGE:
			pagesDescription.get(pageIndex).add(Integer.valueOf(address));
			if (--busyCount[pageIndex] == 0) {
				memory[headerAddress] = FREE_PAGE;
				pageMap.get(pageHelper[pageIndex]).remove(pageIndex);
			}
			break;
		case FREE_PAGE:
		default:
			return;

		}
	}

	public int memRealloc(int address, int newSize) {
		if (address <= 0)
			return NULL;
		int pageIndex = getPageIndex(address);
		if (pagesDescription.get(pageIndex).contains(address))
			return NULL;
		int pageAddress = pageIndex * PAGE_SIZE;
		int newBlockSize = 0;
		for (int blockSize : BLOCK_SIZES) {
			if (newSize <= blockSize) {
				newBlockSize = blockSize;
			}
		}
		if (memory[pageAddress + 3] == newBlockSize)
			return address;
		int newAddress = memAlloc(newSize);
		if (newAddress == NULL)
			return NULL;
		copyData(address, newSize, newAddress);
		memFree(address);
		return newAddress;
	}

	public void copyData(int srcStart, int length, int dest) {
		for (int i = 0; i < length; i++) {
			memory[dest + i] = memory[srcStart + i];
		}
	}

	public String memorySnapshot() {
		StringBuilder sb = new StringBuilder();
		int pos = 0;
		while (pos < MEMORY_SIZE) {
			sb.append(pos);
			switch (memory[pos]) {
			case FREE_PAGE:
				sb.append(" free");
				break;
			case BLOCK_PAGE:
				sb.append(" block ");
				sb.append(memory[pos + 1]);
				sb.append(" ");
				sb.append(memory[pos + 3]);
				break;
			case MULTI_PAGE:
				sb.append(" multi ");
				sb.append(memory[pos + 1]);
			}
			sb.append('\n');
			pos = nextPage(pos);
		}
		return sb.toString();
	}

	public void write(int address, int value) {
		memory[address] = value;
	}

	public int read(int address) {
		return memory[address];
	}

	public static void main(String[] args) {
		Memory memory = new Memory();
		System.out.println(memory.memAlloc(2));
		System.out.println(memory.memAlloc(2));
		System.out.println(memory.memAlloc(2));
		System.out.println(memory.memAlloc(32));
		System.out.println(memory.memAlloc(32));
		System.out.println(memory.memAlloc(32));
		System.out.println(memory.memAlloc(3));
		System.out.println(memory.memAlloc(100));
		System.out.println(memory.memAlloc(32));
		System.out.println(memory.memAlloc(32));
		System.out.println(memory.memAlloc(32));
		System.out.println(memory.memAlloc(2));
		System.out.println(memory.memAlloc(32));
		System.out.println(memory.memorySnapshot());
		memory.memFree(136);
		System.out.println(memory.memorySnapshot());
		memory.memFree(256);
		System.out.println(memory.memorySnapshot());
		System.out.println(memory.memRealloc(136, 3));
	}

}
