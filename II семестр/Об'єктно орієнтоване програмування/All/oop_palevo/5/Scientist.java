/**
 *  Interface that describes a scientist
 * @author Hlushko Olga
 *
 */
public interface Scientist {

	/**
	* @return academic degree of scientist
        */
	public String getAcademicDegree();  //y4enaya stepen

	/**
	* Sets an academic degree
	* @param degree an academic degree to set
	*/
	public void setAcademicDegree(String degree);

	/**
	* @return academic rank of scientist
        */
	public String getAcademicRank();        //y4enoe zvanie

	/**
	* Sets an academic rank
	* @param rank an academic rank to set
	*/
	public void setAcademicRank(String rank);

	/**
	* @return number of scientific publications
        */
	public int getPublicationsNumber();  // number of scientific publications

	/**
	* Sets a number of scientific publications made by scientist
	* @param num number of that publications
	*/
	public void setPublicationsNumber(int num);

}
