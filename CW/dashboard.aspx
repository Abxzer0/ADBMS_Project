<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="CW.WebForm1" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3 class="py-2">
            <small class="text-body-secondary">Dashboard</small>
        </h3>
        <hr />
        <div class="card">
            <div class="card-header">
                <h5>Pie chart of all students enrolled per course</h5>
            </div>
            <div class="row">
                <div class="col-6 justify-content-center d-flex">
                    <asp:Chart Width="350px" Height="350px" ID="Chart1" runat="server" DataSourceID="ctl00">
                        <Series>
                            <asp:Series Name="Series1"
                                XValueMember="NAME"
                                YValueMembers="s_count"
                                ChartType="Pie">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>

                    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:Student_List %>" ProviderName="<%$ ConnectionStrings:Student_List.ProviderName %>"
                        SelectCommand="select c.course_id, c.name as name , count(e.student_id) as s_count from enrollment e full outer join course c on c.course_id = e.course_id group by c.course_id, c.name" ID="ctl00"></asp:SqlDataSource>
                </div>
                <div class="col-6" style="border-left: 1px solid silver">
                    <h6 class="pt-3">Filter Based on Year</h6>
                    <hr />
                    <div class="col-5 d-flex gap-2 align-items-center">
                        <label>Year: </label>
                    </div>
                    <div>
                        <asp:DropDownList CssClass="form-select col" OnSelectedIndexChanged="Enrollment_dd_SelectedIndexChanged" AutoPostBack="true" ID="Year_DD" runat="server">
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
                    </div>

                </div>
            </div>
        </div>

        <div class="card mt-5">
            <div class="card-header">
                <h5>Column Chart of total count of students and teachers per course</h5>
            </div>
            <div>
                <asp:Chart Width="1000px" CssClass="w-auto" runat="server" DataSourceID="Chart2_data" ID="ctl01">
                    <Series>
                        <asp:Series XValueMember="NAME"
                            YValueMembers="student_count" Name="StudentCount" ChartType="Column" IsValueShownAsLabel="true">
                        </asp:Series>
                        <asp:Series XValueMember="NAME"
                            YValueMembers="instructor_count" Name="InstructorCount" ChartType="Column" IsValueShownAsLabel="true">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Course" Interval="1" IsLabelAutoFit="true">
                                <MajorGrid Enabled="False" />
                            </AxisX>
                            <AxisY Title="Techer and student Count">
                                <MajorGrid Enabled="True" />
                            </AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>

            <asp:SqlDataSource ID="Chart2_data" runat="server" ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' SelectCommand="SELECT c.name, sc.student_count, iac.instructor_count FROM course c JOIN (SELECT course_id, COUNT(student_id) AS student_count FROM enrollment GROUP BY course_id) sc ON sc.course_id = c.course_id JOIN (SELECT course_id, COUNT(instructor_id) AS instructor_count FROM instructor_assignment GROUP BY course_id) iac ON iac.course_id = c.course_id"></asp:SqlDataSource>
        </div>

        <div class="card mt-5">
            <div class="card-header">
                <h5>Column Chat of total questions and answers per course</h5>
            </div>
            <div>
                <asp:Chart Width="1000px" DataSourceID="Chart3_data" CssClass="w-auto" ID="Chart2" runat="server">
                    <Series>
                        <asp:Series XValueMember="name"
                            YValueMembers="q" Name="Questions" ChartType="Column" IsValueShownAsLabel="true">
                        </asp:Series>
                        <asp:Series XValueMember="name"
                            YValueMembers="a" Name="answers" ChartType="Column" IsValueShownAsLabel="true">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Course" Interval="1" IsLabelAutoFit="true">
                                <MajorGrid Enabled="False" />
                            </AxisX>
                            <AxisY Title="Question answer count">
                                <MajorGrid Enabled="True" />
                            </AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
            <asp:SqlDataSource ID="Chart3_data" runat="server" ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' SelectCommand="select c.name as name, b.course_id, count(question) as q, count(answer) as a from qna b join course c on c.course_id = b.course_id group by b.course_id, c.name"></asp:SqlDataSource>
        </div>

        <div class="card mt-5">
            <div class="card-header">
                <h5>Pie chart of Students progress status</h5>
            </div>
            <div class="row">
                <div class="col-6 justify-content-center d-flex">
                    <asp:Chart Width="350px" Height="350px" ID="Chart3" runat="server" DataSourceID="qna_data">
                        <Series>
                            <asp:Series Name="Series1"
                                XValueMember="STATUS"
                                YValueMembers="COUNT"
                                ChartType="Pie">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
                <div class="col-6" style="border-left: 1px solid silver">
                    <h6 class="pt-3">Filter Based on Student</h6>
                    <hr />
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
                                    DataValueField="STUDENT_ID">
                                    <asp:ListItem Selected="True">ALL</asp:ListItem>
                                </asp:DropDownList>
                            </itemtemplate>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:SqlDataSource ID="qna_data" runat="server" ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' SelectCommand="SELECT statuses.status, COALESCE(sp.count, 0) AS count FROM (SELECT 'COMPLETED' AS status FROM DUAL UNION ALL SELECT 'IN PROGRESS' AS status FROM DUAL) statuses LEFT JOIN (SELECT status, COUNT(status) AS count FROM student_progress GROUP BY status) sp ON statuses.status = sp.status"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Student_list" runat="server" ConnectionString='<%$ ConnectionStrings:Student_List %>' ProviderName='<%$ ConnectionStrings:Student_List.ProviderName %>' SelectCommand="SELECT STUDENT_ID, NAME FROM STUDENT"></asp:SqlDataSource>
</asp:Content>
