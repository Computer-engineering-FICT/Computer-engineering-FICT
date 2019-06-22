package javenue.csv;

import static org.junit.Assert.*;
import org.junit.Test;

import java.io.StringReader;
import java.util.Arrays;

public class CsvTestCase {
    @Test public void core() {
        Csv.Reader reader = new Csv.Reader(new StringReader("a"));
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("a;b;c"));
        assertEquals(Arrays.asList("a", "b", "c"), reader.readLine());
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("a;b\nc"));
        assertEquals(Arrays.asList("a", "b"), reader.readLine());
        assertEquals(Arrays.asList("c"), reader.readLine());
        assertNull(reader.readLine());
    }

    @Test public void quotes() {
        Csv.Reader reader = new Csv.Reader(new StringReader("\"a;b\";c"));
        assertEquals(Arrays.asList("a;b", "c"), reader.readLine());
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("\"a\"\"b\";c"));
        assertEquals(Arrays.asList("a\"b", "c"), reader.readLine());
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("\"\"\"\";c"));
        assertEquals(Arrays.asList("\"", "c"), reader.readLine());
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("\";\";c"));
        assertEquals(Arrays.asList(";", "c"), reader.readLine());
        assertNull(reader.readLine());
    }

    @Test public void preserveSpaces() {
        Csv.Reader reader = new Csv.Reader(new StringReader("a; b ;\" c \""));
        assertEquals(Arrays.asList("a", " b ", " c "), reader.readLine());

        reader = new Csv.Reader(new StringReader("a; b ;\" c \"")).preserveSpaces(false);
        assertEquals(Arrays.asList("a", "b", " c "), reader.readLine());

        reader = new Csv.Reader(new StringReader("a; \" c \" ")).preserveSpaces(false);
        assertEquals(Arrays.asList("a", " c "), reader.readLine());

        reader = new Csv.Reader(new StringReader(" "));
        assertEquals(Arrays.asList(" "), reader.readLine());

        reader = new Csv.Reader(new StringReader(" \n ")).preserveSpaces(false);
        assertEquals(Arrays.asList(""), reader.readLine());
        assertEquals(Arrays.asList(""), reader.readLine());
        assertNull(reader.readLine());
    }

    @Test public void emptyLines() {
        Csv.Reader reader = new Csv.Reader(new StringReader(""));
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("a\n\nb"));
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertEquals(Arrays.asList(""), reader.readLine());
        assertEquals(Arrays.asList("b"), reader.readLine());
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("\n")).ignoreEmptyLines(true);
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("\n\n\nb\n\n\n")).ignoreEmptyLines(true);
        assertEquals(Arrays.asList("b"), reader.readLine());
        assertNull(reader.readLine());
    }

    @Test public void emptyValues() {
        Csv.Reader reader = new Csv.Reader(new StringReader(";"));
        assertEquals(Arrays.asList("", ""), reader.readLine());
        assertNull(reader.readLine());
    }

    @Test public void trailingLineFeed() {
        Csv.Reader reader = new Csv.Reader(new StringReader("b\n"));
        assertEquals(Arrays.asList("b"), reader.readLine());
        assertNull(reader.readLine());
    }

    @Test public void lineFeed() {
        Csv.Reader reader = new Csv.Reader(new StringReader("a;\"b\nc\";d"));
        assertEquals(Arrays.asList("a", "b\nc", "d"), reader.readLine());

        reader = new Csv.Reader(new StringReader("a;\"b\nc;\n\nd;;\ne\";d"));
        assertEquals(Arrays.asList("a", "b\nc;\n\nd;;\ne", "d"), reader.readLine());
    }

    @Test public void lineFeedEmbeddedQuotes() {
        Csv.Reader reader = new Csv.Reader(new StringReader("a;\"b\"\"\nc\"\"\";d"));
        assertEquals(Arrays.asList("a", "b\"\nc\"", "d"), reader.readLine());
    }

    @Test public void invalidCsv() {
        boolean exceptionCaught = false;
        Csv.Reader reader = new Csv.Reader(new StringReader("a;\"b"));
        try {
            reader.readLine();
        } catch (Csv.FormatException e) {
            exceptionCaught = true;
        }
        assertTrue(exceptionCaught);

        exceptionCaught = false;
        reader = new Csv.Reader(new StringReader("a;\"\"b;\";\""));
        try {
            reader.readLine();
        } catch (Csv.FormatException e) {
            exceptionCaught = true;
        }
        assertTrue(exceptionCaught);

        exceptionCaught = false;
        Csv.Writer writer = new Csv.Writer(new StringBuffer());
        try {
            writer.value("a").comment("comment");
        } catch (Csv.FormatException e) {
            exceptionCaught = true;
        }
        assertTrue(exceptionCaught);
    }

    @Test public void comments() {
        Csv.Reader reader = new Csv.Reader(new StringReader("a\n#a\na"));
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertEquals(Arrays.asList("#a"), reader.readLine());
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("a\n\"#a\"\na"));
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertEquals(Arrays.asList("#a"), reader.readLine());
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("a\n#a\na")).ignoreComments(true);
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("a\n\"#a\"\na")).ignoreComments(true);
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertEquals(Arrays.asList("#a"), reader.readLine());
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("a\n #a\na")).ignoreComments(true).preserveSpaces(false);
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertNull(reader.readLine());

        reader = new Csv.Reader(new StringReader("a\n\" #a\"\na")).ignoreComments(true);
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertEquals(Arrays.asList(" #a"), reader.readLine());
        assertEquals(Arrays.asList("a"), reader.readLine());
        assertNull(reader.readLine());
    }

    @Test public void write() {
        StringBuffer buffer = new StringBuffer();
        Csv.Writer writer = new Csv.Writer(buffer).delimiter(',');
        writer.comment("test start");
        writer.value("a").value("\" b,\"").newLine();
        writer.value("\nc\n").value(" d ").value(null).newLine();
        writer.value("").newLine().newLine().comment("test end").flush().close();

        Csv.Reader reader = new Csv.Reader(new StringReader(buffer.toString())).delimiter(',').ignoreComments(true).ignoreEmptyLines(true);
        assertEquals(Arrays.asList("a", "\" b,\""), reader.readLine());
        assertEquals(Arrays.asList("\nc\n", " d ", ""), reader.readLine());
        assertEquals(Arrays.asList(""), reader.readLine());
        assertNull(reader.readLine());
    }
}
