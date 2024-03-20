<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="qna.aspx.cs" Inherits="CW.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="container w-100">
        <div style="position: sticky; top: 0; background: white" class="py-2">
            <h3>
                <small class="text-body-secondary">QNA List</small>
            </h3>
            <hr />

            <div class="row justify-content-between align-items-center p-3">
                <div class="col-5 d-flex gap-2 align-items-center">
                    <label>Serach by Name: </label>

                    <div>
                        <itemtemplate>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" AutoPostBack="true"></asp:TextBox>
                        </itemtemplate>
                    </div>
                </div>
                <div class="col-2 d-flex justify-content-end">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add Query
                    </button>
                </div>
            </div>

            <hr />
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Query</h1>
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
</asp:Content>
