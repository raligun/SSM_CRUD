package wzy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import wzy.bean.Employee;
import wzy.bean.EmployeeExample;
import wzy.dao.EmployeeMapper;
import wzy.service.EmployeeService;

import java.util.List;

/**
 * @author 网中鱼
 * @date 2021/8/22-21:46
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    public List<Employee> selectAll() {

        return employeeMapper.selectByExampleWithDept(null);
    }

    public int addEmployee(Employee employee) {
        return employeeMapper.insert(employee);
    }

    public boolean filedIsValied(EmployeeExample employeeExample) {
        return !(employeeMapper.countByExample(employeeExample) > 0);
    }

    public Employee getEmp(int id) {
        return employeeMapper.selectByPrimaryKeyWithDept(id);
    }

    public int updateEmp(Employee employee) {
        return employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public int deleteEmp(Integer id) {
        return employeeMapper.deleteByPrimaryKey(id);
    }

    public int deleteEmpBatch(List<Integer> list) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andIdIn(list);
        return employeeMapper.deleteByExample(employeeExample);
    }
}
