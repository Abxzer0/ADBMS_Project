using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BEST_COURSE_DD_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedYear = Year_DD.SelectedValue;
            string selectedMonth = Month_DD.SelectedValue;

            if (selectedYear.ToLower() != "all time" && selectedMonth.ToLower() != "whole year")
            {
                best_course_list.SelectCommand = $"SELECT rownum, course_id, course_name, total_count FROM (SELECT e.course_id AS course_id, COUNT(e.course_id) AS total_count, c.name AS course_name FROM enrollment e JOIN course c ON c.course_id = e.course_id WHERE EXTRACT(YEAR FROM ENROLLED_DATE) = {selectedYear} AND EXTRACT(MONTH FROM ENROLLED_DATE) = {selectedMonth} GROUP BY e.course_id, c.name ORDER BY total_count DESC) subquery WHERE rownum < 4";
            }
            else if (selectedYear.ToLower() != "all time" && selectedMonth.ToLower() == "whole year")
            {
                best_course_list.SelectCommand = $"SELECT rownum, course_id, course_name, total_count FROM (SELECT e.course_id AS course_id, COUNT(e.course_id) AS total_count, c.name AS course_name FROM enrollment e JOIN course c ON c.course_id = e.course_id WHERE EXTRACT(YEAR FROM ENROLLED_DATE) = {selectedYear} GROUP BY e.course_id, c.name ORDER BY total_count DESC) subquery WHERE rownum < 4";
            }
            else if (selectedYear.ToLower() == "all time" && selectedMonth.ToLower() != "whole year")
            {
                best_course_list.SelectCommand = $"SELECT rownum, course_id, course_name, total_count FROM (SELECT e.course_id AS course_id, COUNT(e.course_id) AS total_count, c.name AS course_name FROM enrollment e JOIN course c ON c.course_id = e.course_id WHERE EXTRACT(MONTH FROM ENROLLED_DATE) = {selectedMonth} GROUP BY e.course_id, c.name ORDER BY total_count DESC) subquery WHERE rownum < 4";
            }
            else
            {
                best_course_list.SelectCommand = "SELECT rownum, course_id, course_name, total_count FROM (SELECT e.course_id AS course_id, COUNT(e.course_id) AS total_count, c.name AS course_name FROM enrollment e JOIN course c ON c.course_id = e.course_id GROUP BY e.course_id, c.name ORDER BY total_count DESC) subquery WHERE rownum < 4";
            }

            best_course_grid.DataBind();
        }
    }
}