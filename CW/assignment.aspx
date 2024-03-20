<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="assignment.aspx.cs" Inherits="CW.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container w-100">
        <div style="position: sticky; top: 0; background: white" class="py-2">
            <h3>
                <small class="text-body-secondary">Instructor Assignment List</small>
            </h3>
            <hr />

            <div class="row justify-content-between align-items-center p-3">
                <div class="col-8 d-flex gap-2 align-items-center">
                    <label>Serach by Course: </label>
                    <div>
                        <itemtemplate>
                            <asp:DropDownList 
                                OnSelectedIndexChanged="Instructor_DD_SelectedIndexChanged"
                                ID="Course_dd_filter" runat="server"
                                DataSourceID="Course_List"
                                DataTextField="NAME" 
                                CssClass="form-select col" 
                                AutoPostBack="true"
                                AppendDataBoundItems="true"
                                DataValueField="NAME">

                                <asp:ListItem Selected="True">ALL</asp:ListItem>
                            </asp:DropDownList>
                        </itemtemplate>
                    </div>
                    <label>Instructor Count: </label>
                    <div>
                        <itemtemplate>
                            <asp:TextBox OnTextChanged="Instructor_DD_SelectedIndexChanged" ID="CountTextBox" runat="server" CssClass="form-control" AutoPostBack="true" TextMode="Number"></asp:TextBox>
                        </itemtemplate>
                    </div>
                </div>
                <div class="col-2 d-flex justify-content-end">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Assign Instructor
                    </button>
                </div>
            </div>
            <hr />
            <asp:GridView
                ID="Instructor_assignement_grid"
                runat="server" 
                AutoGenerateColumns="False" AllowPaging="True"
                CssClass="table table-striped table-bordered"
                DataSourceID="Instructor_assignement_list"
                >
                <Columns>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="Course ID" SortExpression="COURSE_ID"></asp:BoundField>
                    <asp:BoundField DataField="COURSE_NAME" HeaderText="Course" SortExpression="COURSE_NAME"></asp:BoundField>
                    <asp:BoundField DataField="INSTRUCTOR_COUNT" HeaderText="Instructor Count" SortExpression="INSTRUCTOR_COUNT"></asp:BoundField>
                    <asp:BoundField DataField="INSTRUCTOR_NAMES" HeaderText="Instructors Name" SortExpression="INSTRUCTOR_NAMES"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </section>
    <asp:SqlDataSource ID="Instructor_assignement_list" runat="server" ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' SelectCommand="SELECT course_id, course_name, instructor_count, instructor_names FROM (SELECT ia.course_id, c.name AS course_name, COUNT(DISTINCT ia.instructor_id) AS instructor_count, LISTAGG(i.name, ', ') WITHIN GROUP (ORDER BY i.name) AS instructor_names FROM instructor_assignment ia JOIN course c ON c.course_id = ia.course_id JOIN instructor i ON ia.instructor_id = i.instructor_id GROUP BY ia.course_id, c.name) subquery"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Course_List" runat="server" ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' SelectCommand="SELECT DISTINCT NAME FROM COURSE ORDER BY NAME ASC"></asp:SqlDataSource>
</asp:Content>
