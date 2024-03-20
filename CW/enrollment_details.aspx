<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="enrollment_details.aspx.cs" Inherits="CW.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container w-100">
        <div style="position: sticky; top: 0; background: white" class="py-2">
            <h3>
                <small class="text-body-secondary">Enrollment Details</small>
            </h3>
            <hr />

            <div class="row justify-content-between align-items-center p-3">
                <div class="col-8 d-flex gap-2 align-items-center">
                    <label>Serach by Student: </label>
                    <div>
                        <itemtemplate>
                            <asp:DropDownList
                                OnSelectedIndexChanged="Student_DD_SelectedIndexChanged"
                                CssClass="form-select col" 
                                ID="Student_dd" runat="server" 
                                DataSourceID="Student_list"
                                DataTextField="NAME" 
                                AutoPostBack="True"
                                AppendDataBoundItems="true"
                                DataValueField="NAME">
                                <asp:ListItem Selected="True">ALL</asp:ListItem>
                            </asp:DropDownList>
                        </itemtemplate>
                    </div>
                    <label>Serach by Course: </label>
                    <div>
                        <itemtemplate>
                            <asp:DropDownList
                                CssClass="form-select col"
                                ID="Course_dd"
                                runat="server"
                                DataSourceID="Course_list"
                                DataTextField="NAME"
                                AutoPostBack="True"
                                AppendDataBoundItems="true"
                                OnSelectedIndexChanged="Student_DD_SelectedIndexChanged"
                                DataValueField="NAME">
                                <asp:ListItem Selected="True">ALL</asp:ListItem>
                            </asp:DropDownList>
                        </itemtemplate>
                    </div>
                </div>
            </div>
            <hr />
            <asp:GridView
                ID="Enrollment_details_grid"
                runat="server"
                CssClass="table table-striped table-bordered"
                DataSourceID="Enrollment_details"
                AutoGenerateColumns="False" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="STUDENT_NAME" HeaderText="Student" SortExpression="STUDENT_NAME"></asp:BoundField>
                    <asp:BoundField DataField="COURSE_NAME" HeaderText="Course" SortExpression="COURSE_NAME"></asp:BoundField>
                    <asp:BoundField DataField="ENROLLED_DATE" DataFormatString="{0:d}" HeaderText="Enrolled Date" SortExpression="ENROLLED_DATE"></asp:BoundField>
                    <asp:BoundField DataField="INSTUCTORS" HeaderText="Instructors" SortExpression="INSTUCTORS"></asp:BoundField>
                    <asp:BoundField DataField="LESSON" HeaderText="Lessons" SortExpression="Lessons"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </section>
    <asp:SqlDataSource
        ID="Enrollment_details"
        runat="server"
        ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>'
        SelectCommand="SELECT s.name AS STUDENT_NAME, c.name AS COURSE_NAME, e.enrolled_date, (SELECT LISTAGG(name, ', ') WITHIN GROUP (ORDER BY name) FROM instructor_assignment ia JOIN instructor i ON ia.instructor_id = i.instructor_id WHERE ia.course_id = e.course_id) AS Instuctors, (SELECT LISTAGG(title, ', ') WITHIN GROUP (ORDER BY title) FROM lesson l JOIN course c ON c.course_id = l.course_id WHERE l.course_id = e.course_id) AS Lesson FROM student s JOIN enrollment e ON s.student_id = e.student_id JOIN course c ON e.course_id = c.course_id ORDER BY STUDENT_NAME ASC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Student_list" runat="server" ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' SelectCommand="SELECT DISTINCT NAME FROM STUDENT ORDER BY NAME ASC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Course_list" runat="server" ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' SelectCommand="SELECT DISTINCT NAME FROM COURSE ORDER BY NAME ASC"></asp:SqlDataSource>
</asp:Content>
