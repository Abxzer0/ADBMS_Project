using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;

namespace CW
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Enrollment_dd_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedYear = Year_DD.SelectedValue;

            if (selectedYear.ToLower() != "all time")
            {
                ctl00.SelectCommand = $"select c.course_id, c.name , count(e.student_id) as s_count from enrollment e full outer join course c on c.course_id = e.course_id WHERE EXTRACT(YEAR FROM ENROLLED_DATE) = {selectedYear} group by c.course_id, c.name";
            }
            else
            {
                ctl00.SelectCommand = "select c.course_id, c.name , count(e.student_id) as s_count from enrollment e full outer join course c on c.course_id = e.course_id group by c.course_id, c.name";
            }

            Chart1.DataBind();
        }


        protected void Student_DD_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedName = Student_dd.SelectedValue;

            if (selectedName.ToLower() != "all")
            {
                qna_data.SelectCommand = $"SELECT statuses.status, COALESCE(sp.count, 0) AS count FROM (SELECT 'COMPLETED' AS status FROM DUAL UNION ALL SELECT 'IN PROGRESS' AS status FROM DUAL) statuses LEFT JOIN (SELECT status, COUNT(status) AS count FROM student_progress WHERE student_id = {selectedName} GROUP BY status) sp ON statuses.status = sp.status";
            }
            else
            {
                qna_data.SelectCommand = "SELECT statuses.status, COALESCE(sp.count, 0) AS count FROM (SELECT 'COMPLETED' AS status FROM DUAL UNION ALL SELECT 'IN PROGRESS' AS status FROM DUAL) statuses LEFT JOIN (SELECT status, COUNT(status) AS count FROM student_progress GROUP BY status) sp ON statuses.status = sp.status";
            }

            Chart3.DataBind();
        }
    }
}