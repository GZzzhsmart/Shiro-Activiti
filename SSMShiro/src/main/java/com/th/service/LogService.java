package com.th.service;

import com.th.model.SysLog;
import com.th.utils.PageInfo;

/**
 * @description：操作日志
 */
public interface LogService {

    void insertLog(SysLog sysLog);

    void findDataGrid(PageInfo pageInfo);
}
