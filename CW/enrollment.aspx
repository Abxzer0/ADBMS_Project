<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="enrollment.aspx.cs" Inherits="CW.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container w-100">
        <div style="position: sticky; top: 0; background: white" class="py-2">
            <h3>
                <small class="text-body-secondary">Enrollment List</small>
            </h3>
            <hr />

            <div class="row justify-content-between align-items-center p-3">
                <div class="col-8 d-flex gap-2 align-items-center">
                    <label>Serach by Course: </label>
                    <div>
                        <itemtemplate>
                        </itemtemplate>
                    </div>
                    <label>Serach by Student: </label>
                    <div>
                        <itemtemplate>
                        </itemtemplate>
                    </div>

                </div>
                <div class="col-2 d-flex justify-content-end">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add Enrollment
                    </button>
                </div>
            </div>

            <hr />

            <asp:GridView
                runat="server"
                DataSourceID="SqlDataSource1"
                ID="Enrollment_Grid" 
                AutoGenerateColumns="False"
                OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID"></asp:BoundField>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID"></asp:BoundField>
                    <asp:TemplateField HeaderText="ENROLLED_DATE">
                        <ItemTemplate>
                            <%# Eval("ENROLLED_DATE") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox Text='<%# Bind("ENROLLED_DATE") %>' runat="server" ID="txtEnrolledDate" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="COURSE Name">
                        <ItemTemplate>
                            <asp:DropDownList
                                runat="server"
                                SelectedValue='<%# Bind("COURSE_ID") %>'
                                DataSourceID="CourseList"
                                ID="ctl0"
                                DataTextField="NAME" Enabled="false" DataValueField="COURSE_ID">
                            </asp:DropDownList>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList
                                runat="server"
                                SelectedValue='<%# Bind("COURSE_ID") %>'
                                DataSourceID="CourseList"
                                ID="ctl06"
                                DataTextField="NAME" Enabled="true" DataValueField="COURSE_ID">
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Enrollment</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row px-4 py-1">
                            <div class="row">
                                <label class="form-label">INSTRUCTOR ID:</label>

                            </div>
                            <div class="row">
                                <label class="form-label">Name</label>

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
    </section>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:Student_List %>"
        DeleteCommand="DELETE FROM ENROLLMENT WHERE (STUDENT_ID = :STUDENT_ID AND COURSE_ID = :COURSE_ID)"
        ProviderName="<%$ ConnectionStrings:Student_List.ProviderName %>"
        SelectCommand="SELECT STUDENT_ID, COURSE_ID, ENROLLED_DATE FROM ENROLLMENT"
        UpdateCommand="UPDATE ENROLLMENT SET STUDENT_ID = :STUDENT_ID, COURSE_ID = :COURSE_ID, ENROLLED_DATE = :ENROLLED_DATE WHERE STUDENT_ID = :STUDENT_ID AND COURSE_ID = :CurrentCourseID">
        <DeleteParameters>
            <asp:Parameter Name="STUDENT_ID" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="ENROLLED_DATE" Type="DateTime"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="STUDENT_ID" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="ENROLLED_DATE" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="CurrentCourseID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CourseList" runat="server" ConnectionString="<%$ ConnectionStrings:Student_List %>" ProviderName="<%$ ConnectionStrings:Student_List.ProviderName %>" SelectCommand="SELECT COURSE_ID, NAME FROM COURSE"></asp:SqlDataSource>

    <asp:SqlDataSource ID="StudentList" runat="server" ConnectionString="<%$ ConnectionStrings:Student_List %>" ProviderName="<%$ ConnectionStrings:Student_List.ProviderName %>" SelectCommand="SELECT COURSE_ID, NAME FROM COURSE"></asp:SqlDataSource>
</asp:Content>
