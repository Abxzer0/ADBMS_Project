<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="progress.aspx.cs" Inherits="CW.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container w-100">
        <div style="position: sticky; top: 0; background: white" class="py-2">
            <h3>
                <small class="text-body-secondary">Progress List</small>
            </h3>
            <hr />

            <div class="row justify-content-end align-items-center p-3">
                <div class="col-2 d-flex justify-content-end">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add Progress
                    </button>
                </div>
            </div>

            <hr />

            <asp:GridView
                ID="Progress_Grid"
                runat="server"
                CssClass="table table-striped table-bordered"
                AutoGenerateColumns="False"
                DataKeyNames="STUDENT_ID,COURSE_ID,LESSON_NO"
                DataSourceID="progress_list"
                OnRowDataBound="Grid_RowDataBound"
                OnRowUpdating="Grid_RowUpdating"
                AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="Student">
                        <ItemTemplate>
                            <asp:DropDownList
                                CssClass="ddl"
                                ID="Student_dd_View"
                                SelectedValue='<%# Bind("STUDENT_ID") %>'
                                DataSourceID="student_list"
                                DataTextField="NAME"
                                DataValueField="STUDENT_ID"
                                Enabled="false"
                                runat="server">
                            </asp:DropDownList>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList
                                ID="Student_dd_edit"
                                SelectedValue='<%# Bind("STUDENT_ID") %>'
                                DataSourceID="student_list"
                                DataTextField="NAME"
                                Enabled="true"
                                DataValueField="STUDENT_ID"
                                runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course">
                        <ItemTemplate>
                            <asp:DropDownList
                                CssClass="ddl"
                                ID="Course_dd_View"
                                SelectedValue='<%# Bind("COURSE_ID") %>'
                                DataSourceID="course_list"
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
                                DataSourceID="course_list"
                                DataTextField="NAME"
                                Enabled="true"
                                DataValueField="COURSE_ID"
                                runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LESSON_NO">
                        <ItemTemplate>
                            <%# Eval("LESSON_NO") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox Text='<%# Bind("LESSON_NO") %>' runat="server" ID="txtLessonNo" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <%# Eval("STATUS") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList SelectedValue='<%# Bind("STATUS") %>' ID="Status_edit_dropdown" runat="server">
                                <asp:ListItem>COMPLETED</asp:ListItem>
                                <asp:ListItem>IN PROGRESS</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Accessed">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("LAST_ACCESSED_DATE", "{0:d}") %>' ID="Label1" runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox Text='<%# Bind("LAST_ACCESSED_DATE") %>' runat="server" ID="txtLastAccessedDate" />
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
        </div>

        <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID,COURSE_ID,LESSON_NO" DataSourceID="progress_list" DefaultMode="Insert">
            <InsertItemTemplate>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Add Progress</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row px-4 py-1">
                                    <div class="row">
                                        <label class="form-label">Student ID</label>
                                        <asp:DropDownList SelectedValue='<%# Bind("STUDENT_ID") %>' CssClass="form-select" ID="student_dd" runat="server" DataSourceID="student_list" DataTextField="NAME" DataValueField="STUDENT_ID"></asp:DropDownList>
                                    </div>
                                    <div class="row">
                                        <label class="form-label">Course ID</label>
                                        <asp:DropDownList SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="form-select" ID="course_dd" runat="server" DataSourceID="course_list" DataTextField="NAME" DataValueField="COURSE_ID"></asp:DropDownList>
                                    </div>
                                    <div class="row">
                                        <label class="form-label">Lesson No</label>
                                        <asp:TextBox CssClass="form-control"  Text='<%# Bind("LESSON_NO") %>' runat="server" ID="LESSON_NOTextBox" />
                                    </div>
                                    <div class="row">
                                        <label class="form-label">Status</label>
                                        <asp:DropDownList SelectedValue='<%# Bind("STATUS") %>' CssClass="form-select" ID="status_dd" runat="server">
                                            <asp:ListItem>IN PROGRESS</asp:ListItem>
                                            <asp:ListItem>COMPLETED</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="row">
                                        <label class="form-label">Last Accessed Date</label>
                                        <asp:TextBox CssClass="form-control" Text='<%# Bind("LAST_ACCESSED_DATE") %>' runat="server" ID="LAST_ACCESSED_DATETextBox" TextMode="Date" />
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



    <asp:SqlDataSource ID="progress_list" runat="server"
        OnInserted="Form_Inserted"
        ConnectionString='<%$ ConnectionStrings:Student_List %>'
        DeleteCommand="DELETE FROM STUDENT_PROGRESS WHERE LESSON_NO = :LESSON_NO AND STUDENT_ID = :STUDENT_ID AND COURSE_ID = :COURSE_ID"
        InsertCommand="INSERT INTO STUDENT_PROGRESS (STUDENT_ID, COURSE_ID, LESSON_NO, STATUS, LAST_ACCESSED_DATE) VALUES (:STUDENT_ID, :COURSE_ID, :LESSON_NO, :STATUS, TO_DATE(:LAST_ACCESSED_DATE,'YYYY/MM/DD'))" 
        ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' 
        SelectCommand="SELECT STUDENT_ID, COURSE_ID, LESSON_NO, STATUS, LAST_ACCESSED_DATE FROM STUDENT_PROGRESS" 
        UpdateCommand="UPDATE STUDENT_PROGRESS SET STUDENT_ID = :STUDENT_ID, COURSE_ID = :COURSE_ID, LESSON_NO = :LESSON_NO, STATUS = :STATUS, LAST_ACCESSED_DATE = :LAST_ACCESSED_DATE WHERE STUDENT_ID = :CURRENT_STUDENT_ID AND LESSON_NO = :CURRENT_LESSON_NO AND COURSE_ID = :CURRENT_COURSE_ID">
        <DeleteParameters>
            <asp:Parameter Name="LESSON_NO"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STUDENT_ID"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID"></asp:Parameter>
            <asp:Parameter Name="LESSON_NO"></asp:Parameter>
            <asp:Parameter Name="STATUS"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="STUDENT_ID"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID"></asp:Parameter>
            <asp:Parameter Name="LESSON_NO"></asp:Parameter>
            <asp:Parameter Name="STATUS"></asp:Parameter>
            <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="CURRENT_STUDENT_ID"></asp:Parameter>
            <asp:Parameter Name="CURRENT_LESSON_NO"></asp:Parameter>
            <asp:Parameter Name="CURRENT_COURSE_ID"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="student_list" runat="server" ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' SelectCommand="SELECT STUDENT_ID, NAME FROM STUDENT"></asp:SqlDataSource>
    <asp:SqlDataSource ID="course_list" runat="server" ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' SelectCommand="SELECT COURSE_ID, NAME FROM COURSE"></asp:SqlDataSource>
</asp:Content>
