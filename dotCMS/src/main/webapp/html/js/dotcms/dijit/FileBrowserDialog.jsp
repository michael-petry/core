<%@ page import="com.liferay.portal.language.LanguageUtil" %>
<div id="${id}" style="display: none;">
    <div dojoAttachPoint="dialog" dojoType="dijit.Dialog" title="<%= LanguageUtil.get(pageContext, "Select-a-file")%>" class="file-selector-tree">
        <form dojoAttachPoint="search_form" onsubmit="return false;">
            <div dojotype="dijit.layout.BorderContainer" design="sidebar" gutters="false" livesplitters="false" class="file-selector-tree__container">
                <div dojotype="dijit.layout.ContentPane" dojoAttachPoint="foldersContentPane" splitter="false" region="leading" title="<%= LanguageUtil.get(pageContext, "Folders")%>" class="portlet-sidebar-wrapper">
                    <div dojoAttachPoint="foldersTreeWrapper" class="file-selector-tree__sidebar">
                        <div dojoAttachPoint="foldersTree"></div>
                    </div>
                </div>
                <div dojotype="dijit.layout.ContentPane" splitter="true" region="center" title="Files" dojoAttachPoint="tablesContentPane" class="file-selector-tree__main">
                    <div class="portlet-main">
                        <div class="portlet-toolbar file-selector-tree__toolbar">
                            <div class="portlet-toolbar__actions-primary">
                                <div class="inline-form">
                                    <label for="filterTextBox"><%= LanguageUtil.get(pageContext, "Filter")%>:</label>
                                    <input dojoType="dijit.form.TextBox" dojoAttachEvent="onKeyup: _filter" trim="true" dojoAttachPoint="filterTextBox" />
                                    <button dojoType="dijit.form.Button" dojoAttachEvent="onClick: _clearFilter" type="button" class="dijitButtonFlat"><%= LanguageUtil.get(pageContext, "Clear")%></button>

                                    <span style="display: none;" dojoAttachPoint="uploadFileButton">
										<button dojoType="dijit.form.Button" dojoAttachEvent="onClick: _addNewFile" type="button"><%= LanguageUtil.get(pageContext, "Upload-New-File")%></button>
									</span>
                                </div>
                            </div>
                            <div class="portlet-toolbar__actions-secondary">
                                <div class="file-selector-tree__views-menu">
                                    <span><%= LanguageUtil.get(pageContext, "View")%>:</span>
                                    <img dojoAttachPoint="listViewIcon" src="/html/images/icons/application-detail.png" alt='<%= LanguageUtil.get(pageContext, "list-view")%>' title='<%= LanguageUtil.get(pageContext, "list-view")%>'>
                                    <img dojoAttachPoint="detailViewIcon" src="/html/images/icons/application-list.png" alt='<%= LanguageUtil.get(pageContext, "details-view")%>' title='<%= LanguageUtil.get(pageContext, "details-view")%>'>
                                    <img dojoAttachPoint="thumbnailViewIcon" src="/html/images/icons/application-icon.png" alt='<%= LanguageUtil.get(pageContext, "thumbnails-view")%>' title='<%= LanguageUtil.get(pageContext, "thumbnails-view")%>'>
                                </div>
                            </div>
                        </div>
                        <div dojoAttachPoint="tablesWrapper" style="display: none" class="file-selector-tree__table">
                            <table dojoAttachPoint="detailsTable" style="display: none;" class="listingTable">
                                <thead>
                                <tr>
                                    <th>
                                        <%= LanguageUtil.get(pageContext, "Name")%>
                                    </th>
                                    <th>
                                        <%= LanguageUtil.get(pageContext, "Description")%>
                                    </th>
                                    <th>
                                        <%= LanguageUtil.get(pageContext, "Mod-User")%>
                                    </th>
                                    <th>
                                        <%= LanguageUtil.get(pageContext, "Mod-Date")%>
                                    </th>
                                </tr>
                                </thead>
                                <tbody dojoAttachPoint="detailsTableBody">
                                </tbody>
                            </table>
                            <table dojoAttachPoint="listTable" style="display: none;" class="listingTable">
                                <tbody dojoAttachPoint="listTableBody">
                                </tbody>
                            </table>
                            <table dojoAttachPoint="thumbnailsTable" style="display: none;" class="thumbnailTD" style="width:100%;">
                                <tbody dojoAttachPoint="thumbnailsTableBody">
                                </tbody>
                            </table>
                        </div>
                        <div dojoAttachPoint="tablesSummary" style="display:none" class="portlet-pagination">
                            <button dojoType="dijit.form.Button" dojoAttachPoint="previousButton" dojoAttachEvent="onClick:_previousButtonClick"><%= LanguageUtil.get(pageContext, "Previous")%></button>
                            <div class="portlet-pagination__results" dojoAttachPoint="resultsSummary"><%= LanguageUtil.get(pageContext, "Viewing-Results-1-of-10")%></div>
                            <button dojoType="dijit.form.Button" dojoAttachPoint="nextButton" dojoAttachEvent="onClick:_nextButtonClick"><%= LanguageUtil.get(pageContext, "Next")%></button>
                        </div>
                        <div dojoAttachPoint="loadingContentWrapper" style="display: none;" class="file-selector-tree__loading">
							<span>
								<%= LanguageUtil.get(pageContext, "Loading")%>
								<br>
								<img src="/html/images/icons/processing.gif">
							</span>
                        </div>
                        <div dojoAttachPoint="noContent" class="file-selector-tree__select-folder">
                            <%= LanguageUtil.get(pageContext, "Please-select-a-folder")%>
                        </div>
                        <div dojoAttachPoint="noResults" style="display: none;" class="file-selector-tree__no-results">
                            <%= LanguageUtil.get(pageContext, "No-files-found")%>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div dojoAttachPoint="addFileDialog" dojoType="dijit.Dialog" title="<%= LanguageUtil.get(pageContext, "Upload-file(s)")%>" style="width: 700px; height: 450px;">
        <div dojoAttachPoint="addFileIFrameWrapper" style="width: 660px; height: 430px;">
            <iframe dojoAttachEvent="onload: _addFileIFrameLoaded" scrolling="no" style="border: 0; width: 680px; height: 400px;" dojoAttachPoint="addAFileIFrame"></iframe>
        </div>
    </div>

</div>
