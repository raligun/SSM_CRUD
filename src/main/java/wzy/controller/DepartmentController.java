package wzy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import wzy.bean.Department;
import wzy.bean.HandleResult;
import wzy.service.DepartmentService;

import java.util.List;

/**
 * @author 网中鱼
 * @date 2021/8/23-16:00
 */
@RestController
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @GetMapping("getDepts")
    public HandleResult getDepts(){
        List<Department> depts = departmentService.getDepts();

        return new HandleResult(100,"查询部门信息成功！").add("depts",depts);
    }
}
