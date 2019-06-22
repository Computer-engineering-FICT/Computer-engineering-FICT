class Node:

    def __init__(self, data, prev, ne11xt):
        self.data = data
        self.prev = prev
        self.next = next


class DoubleLinkedList:

    def __init__(self):
        self.head = None
        self.tail = None

    def add_node(self, data):
        new_node = Node(data, None, None)

        if self.head is None:
            self.head = self.tail = new_node
        else:
            new_node.prev = self.tail
            new_node.next = None
            self.tail.next = new_node
            self.tail = new_node

    def delete_node(self, num):
        count = 0
        current_node = self.head

        while True:
            if count == num:
                if current_node.prev is not None:
                    current_node.prev.next = current_node.next
                    current_node.next.prev = current_node.prev
                else:
                    self.head = current_node.next
                    current_node.next.prev = None
                break
            count += 1
            current_node = current_node.next

    def show(self):
        if self.head is None:
            print(None)
        else:
            current_node = self.head
            while current_node is not None:
                if current_node.next is None:
                    print(current_node.data, end=" ")
                    break
                else:
                    print(current_node.data, end=" ==>> ")
                    current_node = current_node.next

    def show_head(self):
        print(self.head)

    def len_of(self):
        current_node = self.head

        if current_node is None:
            count = 0
        else:
            count = 0
            while current_node is not None:
                current_node = current_node.next
                count += 1

        return count


while True:
    n = 0
    option = int(input("\nSelect operation:\n"
                       "1 - Create a doubly-connected list\n"
                       "2 - Add an item to the list\n"
                       "3 -Rremove an item from the list\n"
                       "4 - Show list\n"
                       "0 - Quit\n"))
    print('\n')

    if option == 1:
        l = DoubleLinkedList()
        print('List is created.')

    elif option == 2:
        el = input('Enter the item you want to add  ')
        l.add_node(el)
        print('The item added to the end of the list.')
    elif option == 3:
        el = int(input('Enter the number of the item you want to delete '))
        l.delete_node(el)

    elif option == 4:
        l.show()

    elif option == 0:
        raise SystemExit
