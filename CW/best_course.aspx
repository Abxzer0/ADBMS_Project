<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="best_course.aspx.cs" Inherits="CW.WebForm12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container w-100">
        <div style="position: sticky; top: 0; background: white" class="py-2">
            <h3>
                <small class="text-body-secondary">Top Course Details</small>
            </h3>
            <hr />

            <div class="row justify-content-between align-items-center p-3">
                <div class="col-5 d-flex gap-2 align-items-center">
                    <label>Year: </label>
                    <div>
                        <itemtemplate>
                            <asp:DropDownList OnSelectedIndexChanged="BEST_COURSE_DD_SelectedIndexChanged" AutoPostBack="true" ID="Year_DD" runat="server">
                                <asp:ListItem Selected="True">ALL TIME</asp:ListItem>
                                <asp:ListItem>1990</asp:ListItem>
                                <asp:ListItem>1991</asp:ListItem>
                                <asp:ListItem>1992</asp:ListItem>
                                <asp:ListItem>1993</asp:ListItem>
                                <asp:ListItem>1994</asp:ListItem>
                                <asp:ListItem>1995</asp:ListItem>
                                <asp:ListItem>1996</asp:ListItem>
                                <asp:ListItem>1997</asp:ListItem>
                                <asp:ListItem>1998</asp:ListItem>
                                <asp:ListItem>1999</asp:ListItem>
                                <asp:ListItem>2000</asp:ListItem>
                                <asp:ListItem>2001</asp:ListItem>
                                <asp:ListItem>2002</asp:ListItem>
                                <asp:ListItem>2003</asp:ListItem>
                                <asp:ListItem>2004</asp:ListItem>
                                <asp:ListItem>2005</asp:ListItem>
                                <asp:ListItem>2006</asp:ListItem>
                                <asp:ListItem>2007</asp:ListItem>
                                <asp:ListItem>2008</asp:ListItem>
                                <asp:ListItem>2009</asp:ListItem>
                                <asp:ListItem>2010</asp:ListItem>
                                <asp:ListItem>2011</asp:ListItem>
                                <asp:ListItem>2012</asp:ListItem>
                                <asp:ListItem>2013</asp:ListItem>
                                <asp:ListItem>2014</asp:ListItem>
                                <asp:ListItem>2015</asp:ListItem>
                                <asp:ListItem>2016</asp:ListItem>
                                <asp:ListItem>2017</asp:ListItem>
                                <asp:ListItem>2018</asp:ListItem>
                                <asp:ListItem>2019</asp:ListItem>
                                <asp:ListItem>2020</asp:ListItem>
                                <asp:ListItem>2021</asp:ListItem>
                                <asp:ListItem>2022</asp:ListItem>
                                <asp:ListItem>2023</asp:ListItem>
                                <asp:ListItem>2024</asp:ListItem>
                                <asp:ListItem>2025</asp:ListItem>
                                <asp:ListItem>2026</asp:ListItem>
                                <asp:ListItem>2027</asp:ListItem>
                                <asp:ListItem>2028</asp:ListItem>
                                <asp:ListItem>2029</asp:ListItem>
                                <asp:ListItem>2030</asp:ListItem>
                            </asp:DropDownList>
                        </itemtemplate>
                    </div>
                    <label>Month: </label>
                    <div>
                        <itemtemplate>
                            <asp:DropDownList OnSelectedIndexChanged="BEST_COURSE_DD_SelectedIndexChanged" AutoPostBack="true" ID="Month_DD" runat="server">
                                <asp:ListItem Selected="True">Whole year</asp:ListItem>
                                <asp:ListItem Value="01">JAN</asp:ListItem>
                                <asp:ListItem Value="02">FEB</asp:ListItem>
                                <asp:ListItem Value="03">MAR</asp:ListItem>
                                <asp:ListItem Value="04">APR</asp:ListItem>
                                <asp:ListItem Value="15">MAY</asp:ListItem>
                                <asp:ListItem Value="16">JUN</asp:ListItem>
                                <asp:ListItem Value="17">JUL</asp:ListItem>
                                <asp:ListItem Value="08">AUG</asp:ListItem>
                                <asp:ListItem Value="09">SEP</asp:ListItem>
                                <asp:ListItem Value="10">OCT</asp:ListItem>
                                <asp:ListItem Value="11">NOV</asp:ListItem>
                                <asp:ListItem Value="12">DEC</asp:ListItem>
                            </asp:DropDownList>
                        </itemtemplate>
                    </div>
                </div>
            </div>
            <hr />
        </div>
        <asp:GridView
            ID="best_course_grid"
            runat="server"
            CssClass="table table-striped table-bordered"
            DataSourceID="best_course_list"
            AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ROWNUM" HeaderText="SN" SortExpression="ROWNUM"></asp:BoundField>
                <asp:BoundField DataField="COURSE_ID" HeaderText="Course ID" SortExpression="COURSE_ID"></asp:BoundField>
                <asp:BoundField DataField="COURSE_NAME" HeaderText="Course" SortExpression="COURSE_NAME"></asp:BoundField>
                <asp:BoundField DataField="TOTAL_COUNT" HeaderText="Students Enrolled" SortExpression="TOTAL_COUNT"></asp:BoundField>
            </Columns>
        </asp:GridView>
    </section>

    <asp:SqlDataSource ID="best_course_list" runat="server" ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' SelectCommand="SELECT rownum, course_id, course_name, total_count FROM (SELECT e.course_id AS course_id, COUNT(e.course_id) AS total_count, c.name AS course_name FROM enrollment e JOIN course c ON c.course_id = e.course_id GROUP BY e.course_id, c.name ORDER BY total_count DESC) subquery WHERE rownum < 4
"></asp:SqlDataSource>
</asp:Content>
