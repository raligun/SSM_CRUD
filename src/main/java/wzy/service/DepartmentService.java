package wzy.service;

import org.springframework.stereotype.Service;
import wzy.bean.Department;

import java.util.List;

/**
 * @author 网中鱼
 * @date 2021/8/23-16:00
 */
@Service
public interface DepartmentService {

    public List<Department> getDepts();
}
