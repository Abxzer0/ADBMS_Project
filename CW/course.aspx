<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="CW.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container w-100">
        <div style="position: sticky; top: 0; background: white" class="py-2">
            <h3>
                <small class="text-body-secondary">Course List</small>
            </h3>
            <hr />

            <div class="row justify-content-between align-items-center p-3">
                <div class="col-5 d-flex gap-2 align-items-center">
                    <label>Serach by Name: </label>

                    <div>
                        <itemtemplate>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                        </itemtemplate>
                    </div>
                </div>
                <div class="col-2 d-flex justify-content-end">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add Course
                    </button>
                </div>
            </div>
            <hr />
        </div>
        <asp:GridView
            CssClass="table table-striped table-hover table-bordered"
            ID="COURSE_GRID"
            OnRowDataBound="GridView1_RowDataBound"
            runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="COURSE_ID"
            DataSourceID="SqlDataSource1"
            AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="COURSE_ID" HeaderText="ID" ReadOnly="True" SortExpression="COURSE_ID"></asp:BoundField>
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME"></asp:BoundField>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-primary">Edit</asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger">Delete</asp:LinkButton>
                        <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Visible="false" CssClass="btn btn-success">Update</asp:LinkButton>
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" Visible="false" CssClass="btn btn-danger">Cancel</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <InsertItemTemplate>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Add Course</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row px-4 py-1">
                                    <div class="row">
                                        <label class="form-label">Course ID:</label>
                                        <asp:TextBox CssClass="form-control" Text='<%# Bind("COURSE_ID") %>' runat="server" ID="COURSE_IDTextBox" />
                                    </div>
                                    <div class="row">
                                        <label class="form-label">Name</label>
                                        <asp:TextBox CssClass="form-control" Text='<%# Bind("NAME") %>' runat="server" ID="NAMETextBox" />
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
    <asp:SqlDataSource ID="SqlDataSource1"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Student_List %>"
        DeleteCommand="DELETE FROM COURSE WHERE COURSE_ID = :COURSE_ID"
        InsertCommand="INSERT INTO COURSE (COURSE_ID, NAME ) VALUES (:COURSE_ID, :NAME)"
        ProviderName="<%$ ConnectionStrings:Student_List.ProviderName %>"
        SelectCommand="SELECT COURSE_ID, NAME FROM COURSE"
        UpdateCommand="UPDATE COURSE SET NAME = :NAME WHERE COURSE_ID = :COURSE_ID">
        <DeleteParameters>
            <asp:Parameter Name="COURSE_ID"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COURSE_ID"></asp:Parameter>
            <asp:Parameter Name="NAME"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NAME"></asp:Parameter>
            <asp:Parameter Name="COURSE_ID"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
