<%@ Page Title="Regex.Match" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegexMatch.aspx.cs" Inherits="DotNetProgrammersToolbox.RegexPatterns.RegexMatch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3>Regex.Match</h3>
<table>
    <tr>
        <td>
            Text to search:</td>
        <td>
            <asp:TextBox ID="SourceTextTextBox" runat="server" Rows="12" 
                TextMode="MultiLine" Width="720px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Regular Expression:</td>
        <td>
            <asp:TextBox ID="RegularExpressionTextBox" runat="server" Rows="4" 
                TextMode="MultiLine" Width="720px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Options:</td>
        <td>
            <asp:CheckBoxList ID="OptionsCheckBoxList" runat="server" 
                DataSourceID="OptionsDataSource" DataTextField="DisplayText" 
                DataValueField="Value" RepeatColumns="3">
            </asp:CheckBoxList>
            <asp:ObjectDataSource ID="OptionsDataSource" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="DotNetProgrammersToolbox.RegexPatterns.RegexOptionData">
            </asp:ObjectDataSource>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td style="text-align: right">
            <asp:Button ID="GoButton" runat="server" onclick="GoButton_Click" Text="Go" /></td>
    </tr>
    <tr id="ErrorsHtmlTableRow" runat="server" visible="false">
        <td>
            Errors:</td>
        <td>
            <asp:BulletedList ID="ErrorsBulletedList" runat="server" ForeColor="#CC0000">
            </asp:BulletedList>
        </td>
    </tr>
    <tr id="ResultsHtmlTableRow" runat="server" visible="false">
        <td>
            Results:</td>
        <td>
            <asp:GridView ID="MatchResultsGridView" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Index" 
                DataSourceID="MatchResultsDataSource" EmptyDataText="No matches">
                <Columns>
                    <asp:BoundField DataField="Success" HeaderText="Success" 
                        SortExpression="Success" />
                    <asp:BoundField DataField="Index" HeaderText="Index" InsertVisible="False" 
                        ReadOnly="True" SortExpression="Index" />
                    <asp:BoundField DataField="Length" HeaderText="Length" ReadOnly="True" 
                        SortExpression="Length" />
                    <asp:BoundField DataField="Value" HeaderText="Value" ReadOnly="True" 
                        SortExpression="Value" />
                    <asp:TemplateField HeaderText="Groups">
                        <ItemTemplate>
                            <asp:GridView ID="GroupsGridView" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Index" 
                                DataSourceID="GroupsDataSource" EmptyDataText="No groups">
                                <Columns>
                                    <asp:BoundField DataField="Success" HeaderText="Success" 
                                        SortExpression="Success" />
                                    <asp:BoundField DataField="Index" HeaderText="Index" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="Index" />
                                    <asp:BoundField DataField="GroupName" HeaderText="Name" ReadOnly="True" 
                                        SortExpression="GroupName" />
                                    <asp:BoundField DataField="Length" HeaderText="Length" ReadOnly="True" 
                                        SortExpression="Length" />
                                    <asp:BoundField DataField="Value" HeaderText="Value" ReadOnly="True" 
                                        SortExpression="Value" />
                                    <asp:TemplateField HeaderText="Captures">
                                        <ItemTemplate>
                                            <asp:GridView ID="CapturesGridView" runat="server" AllowPaging="True" 
                                                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Index" 
                                                DataSourceID="CapturesDataSource" EmptyDataText="No captures">
                                                <Columns>
                                                    <asp:BoundField DataField="Index" HeaderText="Index" InsertVisible="False" 
                                                        ReadOnly="True" SortExpression="Index" />
                                                    <asp:BoundField DataField="Length" HeaderText="Length" ReadOnly="True" 
                                                        SortExpression="Length" />
                                                    <asp:BoundField DataField="Value" HeaderText="Value" ReadOnly="True" 
                                                        SortExpression="Value" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:ObjectDataSource ID="CapturesDataSource" runat="server" 
                                                OldValuesParameterFormatString="original_{0}" 
                                                onobjectcreating="CapturesDataSource_ObjectCreating" SelectMethod="GetData" 
                                                SortParameterName="orderBy" 
                                                TypeName="DotNetProgrammersToolbox.RegexPatterns.GroupCaptureData">
                                                <SelectParameters>
                                                    <asp:Parameter Name="startRowIndex" Type="Int32" />
                                                    <asp:Parameter Name="maximumRows" Type="Int32" />
                                                    <asp:Parameter Name="orderBy" Type="String" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="GroupsDataSource" runat="server" 
                                OldValuesParameterFormatString="original_{0}" 
                                onobjectcreating="GroupsDataSource_ObjectCreating" SelectMethod="GetData" 
                                SortParameterName="orderBy" 
                                TypeName="DotNetProgrammersToolbox.RegexPatterns.MatchGroupingData">
                                <SelectParameters>
                                    <asp:Parameter Name="startRowIndex" Type="Int32" />
                                    <asp:Parameter Name="maximumRows" Type="Int32" />
                                    <asp:Parameter Name="orderBy" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="MatchResultsDataSource" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                onobjectcreating="MatchResultsDataSource_ObjectCreating" SelectMethod="GetData" 
                SortParameterName="orderBy" 
                TypeName="DotNetProgrammersToolbox.RegexPatterns.PatternMatchData">
                <SelectParameters>
                    <asp:Parameter Name="startRowIndex" Type="Int32" />
                    <asp:Parameter Name="maximumRows" Type="Int32" />
                    <asp:Parameter Name="orderBy" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
</table>
</asp:Content>
