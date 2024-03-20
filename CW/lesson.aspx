<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="lesson.aspx.cs" Inherits="CW.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container w-100">
        <div style="position: sticky; top: 0; background: white" class="py-2">
            <h3>
                <small class="text-body-secondary">Lesson List</small>
            </h3>
            <hr />

            <div class="row justify-content-end align-items-center p-3">
                <div class="col-2 d-flex justify-content-end">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add Lesson
                    </button>
                </div>
            </div>
            <hr />
        </div>

        <asp:GridView
            CssClass="table table-striped table-bordered"
            runat="server"
            DataKeyNames="COURSE_ID,LESSON_NO"
            DataSourceID="Lesson_List"
            ID="Lesson_Grid"
            OnRowUpdating="Lesson_RowUpdating"
            OnRowDataBound="Lesson_RowDataBound"
            AutoGenerateColumns="False" AllowPaging="True" PageSize="5">
            <Columns>
                <asp:TemplateField HeaderText="LESSON_NO">
                    <ItemTemplate>
                        <%# Eval("LESSON_NO") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox Text='<%# Bind("LESSON_NO") %>' runat="server" ID="txtLessonNo" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TITLE">
                    <ItemTemplate>
                        <%# Eval("TITLE") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox Text='<%# Bind("TITLE") %>' runat="server" ID="txtTITLE" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="COURSE_ID">
                    <ItemTemplate>
                        <asp:DropDownList
                            CssClass="ddl"
                            ID="Course_dd_View"
                            SelectedValue='<%# Bind("COURSE_ID") %>'
                            DataSourceID="CourseList"
                            DataTextField="NAME"
                            DataValueField="COURSE_ID"
                            Enabled="false"
                            runat="server">
                        </asp:DropDownList>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList
                            ID="Course_dd_edit"
                            SelectedValue='<%# Bind("COURSE_ID") %>'
                            DataSourceID="CourseList"
                            DataTextField="NAME"
                            Enabled="true"
                            DataValueField="COURSE_ID"
                            runat="server">
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="d-inline-flex gap-1">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-primary">Edit</asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger">Delete</asp:LinkButton>
                        <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Visible="false" CssClass="btn btn-success">Update</asp:LinkButton>
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" Visible="false" CssClass="btn btn-danger">Cancel</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:FormView runat="server" DataSourceID="Lesson_List" ID="ctl01" DataKeyNames="LESSON_NO,COURSE_ID" DefaultMode="Insert">
            <InsertItemTemplate>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Add Lesson</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row px-4 py-1">
                                    <div class="row">
                                        <label class="form-label">Course ID:</label>
                                        <asp:DropDownList
                                            CssClass="form-select"
                                            ID="Course_dd_Add"
                                            SelectedValue='<%# Bind("COURSE_ID") %>'
                                            DataSourceID="CourseList"
                                            DataTextField="NAME"
                                            Enabled="true"
                                            DataValueField="COURSE_ID"
                                            runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="row">
                                        <label class="form-label">Lesson No</label>
                                        <asp:TextBox CssClass="form-control" Text='<%# Bind("LESSON_NO") %>' runat="server" ID="LESSON_NOTextBox" />
                                    </div>
                                    <div class="row">
                                        <label class="form-label">Title</label>
                                        <asp:TextBox CssClass="form-control" Text='<%# Bind("TITLE") %>' runat="server" ID="TITLETextBox" />
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton runat="server" CssClass="btn btn-secondary" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                                <asp:LinkButton CssClass="btn btn-primary" runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                            </div>
                        </div>
                    </div>
                </div>
            </InsertItemTemplate>
            <ItemTemplate>
            </ItemTemplate>
        </asp:FormView>

    </section>

    <asp:SqlDataSource ID="Lesson_List"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Student_List %>"
        DeleteCommand="DELETE FROM LESSON WHERE COURSE_ID = :COURSE_ID AND LESSON_NO = :LESSON_NO"
        ProviderName="<%$ ConnectionStrings:Student_List.ProviderName %>"
        SelectCommand="SELECT LESSON_NO, TITLE, COURSE_ID FROM LESSON"
        UpdateCommand="UPDATE LESSON SET LESSON_NO = :LESSON_NO, TITLE = :TITLE, COURSE_ID = :COURSE_ID WHERE COURSE_ID = :CURRENT_COURSE_ID AND LESSON_NO = :CURRENT_LESSON_NO" 
        InsertCommand="INSERT INTO LESSON (COURSE_ID, LESSON_NO, TITLE) VALUES (:COURSE_ID, :LESSON_NO, :TITLE)">
        <DeleteParameters>
            <asp:Parameter Name="COURSE_ID"></asp:Parameter>
            <asp:Parameter Name="LESSON_NO"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COURSE_ID"></asp:Parameter>
            <asp:Parameter Name="LESSON_NO"></asp:Parameter>
            <asp:Parameter Name="TITLE"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LESSON_NO"></asp:Parameter>
            <asp:Parameter Name="TITLE"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID"></asp:Parameter>
            <asp:Parameter Name="CURRENT_COURSE_ID"></asp:Parameter>
            <asp:Parameter Name="CURRENT_LESSON_NO"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CourseList" runat="server" ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' SelectCommand="SELECT COURSE_ID, NAME FROM COURSE"></asp:SqlDataSource>
</asp:Content>
