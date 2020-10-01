part of datagrid;

/// A cell renderer which displays the header text in the columns.
class GridHeaderCellRenderer
    extends GridVirtualizingCellRendererBase<Container, GridHeaderCell> {
  /// Creates the [GridHeaderCellRenderer] for [SfDataGrid] widget.
  GridHeaderCellRenderer(_DataGridStateDetails dataGridStateDetails) {
    _dataGridStateDetails = dataGridStateDetails;
  }

  @override
  void onInitializeDisplayWidget(DataCellBase dataCell, Container widget) {
    if (dataCell != null) {
      var label = Text(
        dataCell.cellValue,
        key: dataCell._key,
        softWrap: dataCell.gridColumn.headerTextSoftWrap,
        overflow: dataCell.gridColumn.headerTextOverflow,
        style: dataCell._cellStyle?.textStyle ??
            _dataGridStateDetails().dataGridThemeData.headerStyle.textStyle,
      );

      dataCell._columnElement = GridHeaderCell(
        key: dataCell._key,
        dataCell: dataCell,
        alignment: dataCell.gridColumn.headerTextAlignment,
        padding: dataCell.gridColumn.padding,
        backgroundColor: dataCell._cellStyle?.backgroundColor ??
            _dataGridStateDetails()
                .dataGridThemeData
                .headerStyle
                .backgroundColor,
        isDirty:
            _dataGridStateDetails().container._isDirty || dataCell._isDirty,
        child: ExcludeSemantics(child: label),
      );

      label = null;
    }
  }

  @override
  void setCellStyle(DataCellBase dataCell) {
    if (dataCell != null) {
      dataCell
        ..cellValue =
            dataCell.gridColumn.headerText ?? dataCell.gridColumn.mappingName
        .._cellStyle = DataGridHeaderCellStyle(
            backgroundColor: dataCell.gridColumn.headerStyle?.backgroundColor ??
                Colors.transparent,
            // Uncomment the below code if the mentioned report has resolved from framework side
            // https://github.com/flutter/flutter/issues/29702
            //this._dataGridStateDetails().dataGridThemeData?.headerStyle?.backgroundColor,
            textStyle: dataCell.gridColumn.headerStyle?.textStyle ??
                _dataGridStateDetails()
                    .dataGridThemeData
                    ?.headerStyle
                    ?.textStyle);
    }
  }
}
