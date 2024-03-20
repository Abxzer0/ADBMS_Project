using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Student_DD_SelectedIndexChanged(object sender, EventArgs e) { 
            string selectedName = Student_dd.SelectedValue;
            string selectedCourse = Course_dd.SelectedValue;

            if (selectedName.ToLower() != "all" && selectedCourse.ToLower() != "all")
            {
                Enrollment_details.SelectCommand = $"SELECT s.name AS STUDENT_NAME, c.name AS COURSE_NAME, e.enrolled_date, (SELECT LISTAGG(name, ', ') WITHIN GROUP (ORDER BY name) FROM instructor_assignment ia JOIN instructor i ON ia.instructor_id = i.instructor_id WHERE ia.course_id = e.course_id) AS Instuctors, (SELECT LISTAGG(title, ', ') WITHIN GROUP (ORDER BY title) FROM lesson l JOIN course c ON c.course_id = l.course_id WHERE l.course_id = e.course_id) AS Lesson FROM student s JOIN enrollment e ON s.student_id = e.student_id JOIN course c ON e.course_id = c.course_id WHERE s.name = '{selectedName}' AND c.name = '{selectedCourse}' ORDER BY STUDENT_NAME ASC";
            }
            else if (selectedName.ToLower() != "all" && selectedCourse.ToLower() == "all") {
                Enrollment_details.SelectCommand = $"SELECT s.name AS STUDENT_NAME, c.name AS COURSE_NAME, e.enrolled_date, (SELECT LISTAGG(name, ', ') WITHIN GROUP (ORDER BY name) FROM instructor_assignment ia JOIN instructor i ON ia.instructor_id = i.instructor_id WHERE ia.course_id = e.course_id) AS Instuctors, (SELECT LISTAGG(title, ', ') WITHIN GROUP (ORDER BY title) FROM lesson l JOIN course c ON c.course_id = l.course_id WHERE l.course_id = e.course_id) AS Lesson FROM student s JOIN enrollment e ON s.student_id = e.student_id JOIN course c ON e.course_id = c.course_id WHERE s.name = '{selectedName}' ORDER BY STUDENT_NAME ASC";
            } else if (selectedName.ToLower() == "all" && selectedCourse.ToLower() != "all") {
                Enrollment_details.SelectCommand = $"SELECT s.name AS STUDENT_NAME, c.name AS COURSE_NAME, e.enrolled_date, (SELECT LISTAGG(name, ', ') WITHIN GROUP (ORDER BY name) FROM instructor_assignment ia JOIN instructor i ON ia.instructor_id = i.instructor_id WHERE ia.course_id = e.course_id) AS Instuctors, (SELECT LISTAGG(title, ', ') WITHIN GROUP (ORDER BY title) FROM lesson l JOIN course c ON c.course_id = l.course_id WHERE l.course_id = e.course_id) AS Lesson FROM student s JOIN enrollment e ON s.student_id = e.student_id JOIN course c ON e.course_id = c.course_id WHERE c.name = '{selectedCourse}' ORDER BY STUDENT_NAME ASC";
            }
            else {
                Enrollment_details.SelectCommand = "SELECT s.name AS STUDENT_NAME, c.name AS COURSE_NAME, e.enrolled_date, (SELECT LISTAGG(name, ', ') WITHIN GROUP (ORDER BY name) FROM instructor_assignment ia JOIN instructor i ON ia.instructor_id = i.instructor_id WHERE ia.course_id = e.course_id) AS Instuctors, (SELECT LISTAGG(title, ', ') WITHIN GROUP (ORDER BY title) FROM lesson l JOIN course c ON c.course_id = l.course_id WHERE l.course_id = e.course_id) AS Lesson FROM student s JOIN enrollment e ON s.student_id = e.student_id JOIN course c ON e.course_id = c.course_id ORDER BY STUDENT_NAME ASC";
            }

            Enrollment_details_grid.DataBind();
        }
    }
}