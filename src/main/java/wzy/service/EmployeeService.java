package wzy.service;

import org.springframework.stereotype.Service;
import wzy.bean.Employee;
import wzy.bean.EmployeeExample;

import java.util.List;

/**
 * @author 网中鱼
 * @date 2021/8/22-21:45
 */
@Service
public interface EmployeeService {

    public List<Employee> selectAll();

    int addEmployee(Employee employee);

    /**
     * 判断用户信息是否已经存在
     * @param employeeExample
     * @return 已存在返回true
     */
    boolean filedIsValied(EmployeeExample employeeExample);

    Employee getEmp(int id);

    int updateEmp(Employee employee);

    int deleteEmp(Integer id);

    int deleteEmpBatch(List<Integer> list);
}
