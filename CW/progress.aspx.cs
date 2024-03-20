using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Progress_Grid.EditIndex == e.Row.RowIndex)
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

        protected void Grid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            DropDownList newCourse = (DropDownList)Progress_Grid.Rows[e.RowIndex].FindControl("Course_dd_edit");
            string newCourseId = newCourse.SelectedValue;

            DropDownList newStudent = (DropDownList)Progress_Grid.Rows[e.RowIndex].FindControl("Student_dd_edit");
            string newStudentId = newStudent.SelectedValue;

            TextBox newLesson = (TextBox)Progress_Grid.Rows[e.RowIndex].FindControl("txtLessonNo");
            string newLessonId = newLesson.Text;

            DropDownList newStatus = (DropDownList)Progress_Grid.Rows[e.RowIndex].FindControl("Status_edit_dropdown");
            string newStatusID = newStatus.SelectedValue;

            TextBox newDate = (TextBox)Progress_Grid.Rows[e.RowIndex].FindControl("txtLastAccessedDate");
            string newDateTime = newDate.Text;


            string currentLessonNo = Progress_Grid.DataKeys[e.RowIndex]["LESSON_NO"].ToString();
            string currentCourseID = Progress_Grid.DataKeys[e.RowIndex]["COURSE_ID"].ToString();
            string currentStudentID = Progress_Grid.DataKeys[e.RowIndex]["STUDENT_ID"].ToString();

            progress_list.UpdateParameters["COURSE_ID"].DefaultValue = newCourseId;
            progress_list.UpdateParameters["LESSON_NO"].DefaultValue = newLessonId;
            progress_list.UpdateParameters["STUDENT_ID"].DefaultValue = newStudentId;
            progress_list.UpdateParameters["CURRENT_COURSE_ID"].DefaultValue = currentCourseID;
            progress_list.UpdateParameters["CURRENT_LESSON_NO"].DefaultValue = currentLessonNo;
            progress_list.UpdateParameters["CURRENT_STUDENT_ID"].DefaultValue = currentStudentID;
            progress_list.UpdateParameters["LAST_ACCESSED_DATE"].DefaultValue = newDateTime;
            progress_list.UpdateParameters["STATUS"].DefaultValue = newStatusID;


            progress_list.Update();
            Progress_Grid.EditIndex = -1;
            Progress_Grid.DataBind();
        }

        protected void Form_Inserted(object sender, SqlDataSourceStatusEventArgs e) { 
        
            if (e.Exception != null) { 

                string script = "alert('Error: Duplicate entry found.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
                e.ExceptionHandled = true;
            }
            else
            {
                // Handle other database errors
            }
        }
    }
}