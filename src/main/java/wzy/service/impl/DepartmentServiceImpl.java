package wzy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import wzy.bean.Department;
import wzy.dao.DepartmentMapper;
import wzy.service.DepartmentService;

import java.util.List;

/**
 * @author 网中鱼
 * @date 2021/8/23-16:03
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts() {
        return departmentMapper.selectByExample(null);
    }
}
