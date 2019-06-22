package com;

import java.util.List;

public class Graph {
    private final List<Processor> processors;
    private final List<Link> links;

    public Graph(List<Processor> processors, List<Link> links) {
        this.processors = processors;
        this.links = links;
    }

    public List<Processor> getProcessors() {
        return processors;
    }

    public List<Link> getLinks() {
        return links;
    }



}
