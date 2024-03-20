using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Instructor_DD_SelectedIndexChanged(object sender, EventArgs e)
        {
            string count = CountTextBox.Text.Trim().ToLower();
            string selectedCourse = Course_dd_filter.SelectedValue;

            if (!(count == "" || count == null) && selectedCourse.ToLower() != "all")
            {
                Instructor_assignement_list.SelectCommand = $"SELECT course_id, course_name, instructor_count, instructor_names FROM (SELECT ia.course_id, c.name AS course_name, COUNT(DISTINCT ia.instructor_id) AS instructor_count, LISTAGG(i.name, ', ') WITHIN GROUP (ORDER BY i.name) AS instructor_names FROM instructor_assignment ia JOIN course c ON c.course_id = ia.course_id JOIN instructor i ON ia.instructor_id = i.instructor_id GROUP BY ia.course_id, c.name) subquery WHERE instructor_count={count} AND course_name = '{selectedCourse}'";
            }
            else if (!(count == "" || count == null) && selectedCourse.ToLower() == "all")
            {
                Instructor_assignement_list.SelectCommand = $"SELECT course_id, course_name, instructor_count, instructor_names FROM (SELECT ia.course_id, c.name AS course_name, COUNT(DISTINCT ia.instructor_id) AS instructor_count, LISTAGG(i.name, ', ') WITHIN GROUP (ORDER BY i.name) AS instructor_names FROM instructor_assignment ia JOIN course c ON c.course_id = ia.course_id JOIN instructor i ON ia.instructor_id = i.instructor_id GROUP BY ia.course_id, c.name) subquery WHERE instructor_count={count}";
            }
            else if ((count == "" || count == null) && selectedCourse.ToLower() != "all")
            {
                Instructor_assignement_list.SelectCommand = $"SELECT course_id, course_name, instructor_count, instructor_names FROM (SELECT ia.course_id, c.name AS course_name, COUNT(DISTINCT ia.instructor_id) AS instructor_count, LISTAGG(i.name, ', ') WITHIN GROUP (ORDER BY i.name) AS instructor_names FROM instructor_assignment ia JOIN course c ON c.course_id = ia.course_id JOIN instructor i ON ia.instructor_id = i.instructor_id GROUP BY ia.course_id, c.name) subquery WHERE course_name = '{selectedCourse}'";
            }
            else
            {
                Instructor_assignement_list.SelectCommand = "SELECT course_id, course_name, instructor_count, instructor_names FROM (SELECT ia.course_id, c.name AS course_name, COUNT(DISTINCT ia.instructor_id) AS instructor_count, LISTAGG(i.name, ', ') WITHIN GROUP (ORDER BY i.name) AS instructor_names FROM instructor_assignment ia JOIN course c ON c.course_id = ia.course_id JOIN instructor i ON ia.instructor_id = i.instructor_id GROUP BY ia.course_id, c.name) subquery";
            }

            Instructor_assignement_grid.DataBind();
        }
    }
}