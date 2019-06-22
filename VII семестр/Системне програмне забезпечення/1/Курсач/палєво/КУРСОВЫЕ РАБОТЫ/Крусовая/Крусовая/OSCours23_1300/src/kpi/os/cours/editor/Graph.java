package kpi.os.cours.editor;

import com.mxgraph.model.mxCell;
import com.mxgraph.view.mxGraph;

public class Graph extends mxGraph {
    /**
     * Текущий шаблон соединений на графе.
     */
    protected Object edgeTemplate;
    protected mxGraph graph;
    
    public Graph() {
        graph = new mxGraph();             
    }
    
    /**
     * Изменения шаблона соединений на графе.
     */
    public void setEdgeTemplate(Object template)
    {
        edgeTemplate = template;
    }
    
    /**
     * Переопределение метода создания соединений на графе с учетом стиля
     * отображения соединений.
     */
    public Object createEdge(Object parent, String id, Object value,
            Object source, Object target, String style)
    {
        if (edgeTemplate != null)
        {
            mxCell edge = (mxCell) cloneCells(new Object[] { edgeTemplate })[0];
            edge.setId(id);

            return edge;
        }

        return super.createEdge(parent, id, value, source, target, style);
    }   
}
