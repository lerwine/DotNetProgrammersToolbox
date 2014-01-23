<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegexEditor.aspx.cs" Inherits="DotNetProgrammersToolbox.RegexPatterns.RegexEditor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        table.grouping
        {
            border-style: solid solid none solid;
            border-width: 4px;
            border-color: #000099;
            border-collapse: collapse;
        }
        tr.expandContract
        {
            background-color: #BCC4D3;
        }
        td.openGroup
        {
            vertical-align: bottom;
            padding: 0px 4px 0px 8px;
            white-space: nowrap;
            font-weight: bold;
            background-color: #BCC4D3;
        }
        td.logicalSeparator
        {
            border-style: none solid none none;
            border-width: 4px;
            border-color: #000099;
            vertical-align: bottom;
            white-space: nowrap;
            padding: 0px 8px 0px 8px;
            font-weight: bold;
            background-color: #BCC4D3;
        }
        td.groupContent
        {
            vertical-align: bottom;
            white-space: nowrap;
            padding: 4px 4px 0px 4px;
        }
        
        table.groupContent
        {
            border-style: none;
            border-collapse: collapse;
        }
        
        td.closeGroup
        {
            vertical-align: bottom;
            padding: 0px 8px 0px 4px;
            white-space: nowrap;
            font-weight: bold;
            background-color: #BCC4D3;
        }
        tr.expandContract > th
        {
            font-weight: normal;
            font-size: small;
            vertical-align: top;
            text-align: left;
            white-space: nowrap;
            padding: 0px;
        }
        
        .toggleButton
        {
            color: #FFFFFF;
            background-color: #000099;
            padding: 2px;
            margin: 0px;
            float: left;
        }
        
        th.logicalSeparator
        {
            border-style: none solid none none;
            border-width: 4px;
            border-color: #000099;
            background-color: #BCC4D3;
        }
        
        span.namedGroup
        {
            color: #CC0000;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:PlaceHolder ID="BeforeEditPlaceHolder" runat="server"></asp:PlaceHolder>
   <%-- 
    <div class="grouping">
        <div class="groupClose">)</div>
        <div class="groupOpen">(</div>
        <div class="groupContent">
            <div class="expandContract"><div class="toggleButton">[-]</div></div>
            <div class="expressionText"></div>
        </div>
    </div>--%>
    
    <div style="clear: both;">
    
    <table class="grouping">
        <tr class="expandContract">
            <th colspan="2"><div class="toggleButton">[-]</div></th>
            <th class="logicalSeparator"></th>
            <th colspan="2"><div class="toggleButton">[-]</div></th>
        </tr>
        <tr>
            <td class="openGroup">(</td>
            <td class="groupContent">
                <table class="grouping">
                    <tr class="expandContract">
                        <th colspan="3"><div class="toggleButton">[-]</div></th>
                    </tr>
                    <tr>
                        <td class="openGroup">(<span class="namedGroup">?&lt;url&gt;</span></td>
                        <td class="groupContent">
                            <table class="groupContent">
                                <tr>
                                    <td class="groupContent">http</td>
                                    <td class="groupContent">
                                        <table class="grouping">
                                            <tr class="expandContract">
                                                <th colspan="3"><div class="toggleButton">[-]</div></th>
                                            </tr>
                                            <tr>
                                                <td class="openGroup">(</td>
                                                <td class="groupContent">s</td>
                                                <td class="closeGroup">)?</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="groupContent">://</td>
                                    <td class="groupContent">
                                        <table class="grouping">
                                            <tr class="expandContract">
                                                <th colspan="3"><div class="toggleButton">[-]</div></th>
                                            </tr>
                                            <tr>
                                                <td class="openGroup">(</td>
                                                <td class="groupContent">[\w-]+\.</td>
                                                <td class="closeGroup">)+</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="groupContent">[\w-]+</td>
                                    <td class="groupContent">
                                        <table class="grouping">
                                            <tr class="expandContract">
                                                <th colspan="3"><div class="toggleButton">[-]</div></th>
                                            </tr>
                                            <tr>
                                                <td class="openGroup">(</td>
                                                <td class="groupContent">/[\w- ./?%&amp;=]*</td>
                                                <td class="closeGroup">)?</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td class="closeGroup">)</td>
                    </tr>
                </table>
            </td>
            <td class="logicalSeparator">|</td>
            <td class="groupContent">
                <table class="grouping">
                    <tr class="expandContract">
                        <th colspan="3"><div class="toggleButton">[-]</div></th>
                    </tr>
                    <tr>
                        <td class="openGroup">(<span class="namedGroup">?&lt;email&gt;</span></td>
                        <td class="groupContent">
                            <table class="groupContent">
                                <tr>
                                    <td class="groupContent">\w+</td>
                                    <td class="groupContent">
                                        <table class="grouping">
                                            <tr class="expandContract">
                                                <th colspan="3"><div class="toggleButton">[-]</div></th>
                                            </tr>
                                            <tr>
                                                <td class="openGroup">(</td>
                                                <td class="groupContent">[-+.']\w+</td>
                                                <td class="closeGroup">)*</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="groupContent">@\w+</td>
                                    <td class="groupContent">
                                        <table class="grouping">
                                            <tr class="expandContract">
                                                <th colspan="3"><div class="toggleButton">[-]</div></th>
                                            </tr>
                                            <tr>
                                                <td class="openGroup">(</td>
                                                <td class="groupContent">[-.]\w+</td>
                                                <td class="closeGroup">)*</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="groupContent">\.\w+</td>
                                    <td class="groupContent">
                                        <table class="grouping">
                                            <tr class="expandContract">
                                                <th colspan="3"><div class="toggleButton">[-]</div></th>
                                            </tr>
                                            <tr>
                                                <td class="openGroup">(</td>
                                                <td class="groupContent">[-.]\w+</td>
                                                <td class="closeGroup">)*</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td class="closeGroup">)</td>
                    </tr>
                </table>
            </td>
            <td class="closeGroup">)</td>
        </tr>
    </table>
    
    
    

    </div>
    <asp:PlaceHolder ID="AfterEditPlaceHolder" runat="server"></asp:PlaceHolder>
    
    
    </form>
    </body>
</html>
