using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Lesson_RowUpdating(object sender, GridViewUpdateEventArgs e) {

            DropDownList newCourse = (DropDownList)Lesson_Grid.Rows[e.RowIndex].FindControl("Course_dd_edit");
            string newCourseId = newCourse.SelectedValue;

            TextBox newLesson = (TextBox)Lesson_Grid.Rows[e.RowIndex].FindControl("txtLessonNo");
            string newLessonId = newLesson.Text;

            TextBox newTitle = (TextBox)Lesson_Grid.Rows[e.RowIndex].FindControl("txtTitle");
            string newTitleValue = newTitle.Text;


            string currentLessonNo = Lesson_Grid.DataKeys[e.RowIndex]["LESSON_NO"].ToString();
            string currentCourseID = Lesson_Grid.DataKeys[e.RowIndex]["COURSE_ID"].ToString();

            Lesson_List.UpdateParameters["COURSE_ID"].DefaultValue = newCourseId;
            Lesson_List.UpdateParameters["LESSON_NO"].DefaultValue = newLessonId;
            Lesson_List.UpdateParameters["CURRENT_COURSE_ID"].DefaultValue = currentCourseID;
            Lesson_List.UpdateParameters["CURRENT_LESSON_NO"].DefaultValue = currentLessonNo;
            Lesson_List.UpdateParameters["TITLE"].DefaultValue = newTitleValue;
            

            Lesson_List.Update();
            Lesson_Grid.EditIndex = -1;
            Lesson_Grid.DataBind();
        }

        protected void Lesson_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (Lesson_Grid.EditIndex == e.Row.RowIndex)
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
}