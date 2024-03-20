<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="instructor.aspx.cs" Inherits="CW.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container w-100">
        <div style="position: sticky; top: 0; background: white" class="py-2">
            <h3>
                <small class="text-body-secondary">Instructor List</small>
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
                        Add Instructor
                    </button>
                </div>
            </div>

            <hr />

            <asp:GridView
                CssClass="table table-striped table-hover table-bordered"
                runat="server"
                DataSourceID="SqlDataSource1"
                ID="Instuctor_Grid"
                AllowPaging="True"
                OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" DataKeyNames="INSTRUCTOR_ID" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID"></asp:BoundField>
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
        </div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <InsertItemTemplate>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Add Instructor</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row px-4 py-1">
                                    <div class="row">
                                        <label class="form-label">INSTRUCTOR ID:</label>
                                        <asp:TextBox CssClass="form-control" Text='<%# Bind("INSTRUCTOR_ID") %>' runat="server" ID="TextBox3" TextMode="Number" />
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

    <asp:SqlDataSource
        ID="SqlDataSource1"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Student_List %>"
        ProviderName="<%$ ConnectionStrings:Student_List.ProviderName %>"
        DeleteCommand="DELETE FROM INSTRUCTOR WHERE INSTRUCTOR_ID = :INSTRUCTOR_ID"
        SelectCommand="SELECT INSTRUCTOR_ID, NAME FROM INSTRUCTOR"
        InsertCommand="INSERT INTO INSTRUCTOR (INSTRUCTOR_ID, NAME ) VALUES (:INSTRUCTOR_ID, :NAME)"
        UpdateCommand="UPDATE INSTRUCTOR SET NAME = :NAME WHERE INSTRUCTOR_ID = :INSTRUCTOR_ID">
        <DeleteParameters>
            <asp:Parameter Name="INSTRUCTOR_ID" Type="Decimal"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="INSTRUCTOR_ID" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="NAME" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NAME" Type="String"></asp:Parameter>
            <asp:Parameter Name="INSTRUCTOR_ID" Type="Decimal"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
