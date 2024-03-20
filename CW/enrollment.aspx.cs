using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Enrollment_Grid.EditIndex == e.Row.RowIndex)
                {
                    LinkButton btnEdit = (LinkButton)e.Row.FindControl("btnEdit");
                    LinkButton btnUpdate = (LinkButton)e.Row.FindControl("btnUpdate");
                    LinkButton btnCancel = (LinkButton)e.Row.FindControl("btnCancel");
                    LinkButton btnDelete = (LinkButton)e.Row.FindControl("btnDelete");

                    if (btnEdit != null)
                    {
                        btnEdit.Visible = false;
                        btnDelete.Visible = false;
                        btnCancel.Visible = true;
                        btnUpdate.Visible = true;
                    }
                    else if (btnUpdate != null)
                    {
                        btnUpdate.Visible = false;
                        btnEdit.Visible = true;
                        btnCancel.Visible = false;
                        btnDelete.Visible = true;
                    }
                }
                else
                {
                    LinkButton btnDelete = (LinkButton)e.Row.FindControl("btnDelete");
                    if (btnDelete != null)
                    {
                        btnDelete.Attributes["onclick"] = "return confirm('Are you sure you want to delete this row?');";
                    }
                }
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Get the new Course ID from the dropdown
            DropDownList ddlCourse = (DropDownList)Enrollment_Grid.Rows[e.RowIndex].FindControl("ctl06");
            string newCourseID = ddlCourse.SelectedValue;


            TextBox txtEnrolledDate = (TextBox)Enrollment_Grid.Rows[e.RowIndex].FindControl("txtEnrolledDate");
            string updatedEnrolledDate = txtEnrolledDate.Text;

            string studentID = Enrollment_Grid.DataKeys[e.RowIndex]["STUDENT_ID"].ToString();
            string currentCourseID = Enrollment_Grid.DataKeys[e.RowIndex]["COURSE_ID"].ToString();

            SqlDataSource1.UpdateCommand = $"UPDATE ENROLLMENT SET STUDENT_ID = {decimal.Parse(studentID)}, COURSE_ID = {decimal.Parse(newCourseID)} WHERE STUDENT_ID = {decimal.Parse(studentID)} AND COURSE_ID = {decimal.Parse(currentCourseID)}";

            SqlDataSource1.Update();
            Enrollment_Grid.EditIndex = -1;
            Enrollment_Grid.DataBind();

        }
    }
}
