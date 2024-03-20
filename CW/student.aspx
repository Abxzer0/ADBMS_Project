<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="CW.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container w-100">

        <div style="position: sticky; top: 0; background: white" class="py-2">
            <h3>
                <small class="text-body-secondary">Students List</small>
            </h3>
            <hr />

            <div class="row justify-content-between align-items-center p-3">
                <div class="col-4 d-flex gap-2 align-items-center">
                    <label>Select Country: </label>
                    <div>
                        <asp:DropDownList
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                            CssClass="form-select col"
                            runat="server"
                            DataSourceID="SqlDataSource1"
                            ID="ctl15" DataTextField="COUNTRY"
                            DataValueField="COUNTRY" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-2 d-flex justify-content-end">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add Student
               
                    </button>
                </div>
            </div>
            <hr />
        </div>


        <asp:GridView
            CssClass="table table-striped table-bordered"
            runat="server" DataSourceID="ctl00"
            ID="Students_Grid"
            AutoGenerateColumns="False"
            DataKeyNames="STUDENT_ID"
            OnRowDataBound="GridView1_RowDataBound"
            AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="STUDENT_ID" HeaderText="ID" ReadOnly="True" SortExpression="STUDENT_ID"></asp:BoundField>
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME"></asp:BoundField>
                <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY"></asp:BoundField>
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL"></asp:BoundField>
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" DataFormatString="{0:d}"></asp:BoundField>
                <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT"></asp:BoundField>
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
        <asp:FormView runat="server" DataSourceID="ctl00" ID="ctl19" DataKeyNames="STUDENT_ID" DefaultMode="Insert">
            <InsertItemTemplate>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Add Student</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row px-4 py-1">
                                    <div class="row">
                                        <label class="form-label">Name</label>
                                        <asp:TextBox CssClass="form-control" Text='<%# Bind("NAME") %>' runat="server" ID="NAMETextBox" />
                                    </div>
                                    <div class="row">
                                        <label class="form-label">Contact</label>
                                        <asp:TextBox CssClass="form-control" Text='<%# Bind("CONTACT") %>' runat="server" ID="CONTACTTextBox" TextMode="Number" />
                                    </div>
                                    <div class="row">
                                        <label class="form-label">Email</label>
                                        <asp:TextBox CssClass="form-control" Text='<%# Bind("EMAIL") %>' runat="server" ID="EMAILTextBox" TextMode="Email" />
                                    </div>
                                    <div class="row">
                                        <label class="form-label">Country</label>
                                        <asp:TextBox CssClass="form-control" Text='<%# Bind("COUNTRY") %>' runat="server" ID="COUNTRYTextBox" />
                                    </div>
                                    <div class="row">
                                        <label class="form-label">DOB</label>
                                        <asp:TextBox CssClass="form-control" Text='<%# Bind("DOB") %>' runat="server" ID="DOBTextBox" TextMode="Date" />
                                    </div>
                                    <div class="row">
                                        <label class="form-label">Student ID</label>
                                        <asp:TextBox CssClass="form-control" Text='<%# Bind("STUDENT_ID") %>' runat="server" ID="STUDENT_IDTextBox" />
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
            <ItemTemplate></ItemTemplate>
        </asp:FormView>
    </section>
    <asp:SqlDataSource runat="server"
        OnInserted="Form_Inserted"
        ConnectionString="<%$ ConnectionStrings:Student_List %>"
        ProviderName="<%$ ConnectionStrings:Student_List.ProviderName %>"
        DeleteCommand="DELETE FROM STUDENT WHERE STUDENT_ID = :STUDENT_ID"
        InsertCommand="INSERT INTO STUDENT (COUNTRY, EMAIL, DOB, CONTACT, NAME, STUDENT_ID) VALUES (:COUNTRY, :EMAIL, :DOB, :CONTACT, :NAME, :STUDENT_ID)"
        SelectCommand="SELECT COUNTRY, EMAIL, DOB, CONTACT, NAME, STUDENT_ID FROM STUDENT"
        UpdateCommand="UPDATE STUDENT SET COUNTRY = :COUNTRY, EMAIL = :EMAIL, DOB = :DOB, CONTACT = :CONTACT, NAME = :NAME WHERE STUDENT_ID = :STUDENT_ID"
        ID="ctl00">

        <DeleteParameters>
            <asp:Parameter Name="STUDENT_ID" Type="Decimal"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COUNTRY" Type="String"></asp:Parameter>
            <asp:Parameter Name="EMAIL" Type="String"></asp:Parameter>
            <asp:Parameter Name="DOB" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="CONTACT" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="NAME" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="Decimal"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="COUNTRY" Type="String"></asp:Parameter>
            <asp:Parameter Name="EMAIL" Type="String"></asp:Parameter>
            <asp:Parameter Name="DOB" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="CONTACT" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="NAME" Type="String"></asp:Parameter>
            <asp:Parameter Name="STUDENT_ID" Type="Decimal"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource
        ID="SqlDataSource1"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Student_List %>"
        ProviderName="<%$ ConnectionStrings:Student_List.ProviderName %>"
        SelectCommand="select DISTINCT country from student UNION ALL SELECT 'ALL' as Country FROM DUAL ORDER BY COUNTRY ASC"></asp:SqlDataSource>

</asp:Content>
