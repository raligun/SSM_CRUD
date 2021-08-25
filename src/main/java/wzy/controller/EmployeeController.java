package wzy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import wzy.bean.Employee;
import wzy.bean.EmployeeExample;
import wzy.bean.HandleResult;
import wzy.service.EmployeeService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 网中鱼
 * @date 2021/8/22-21:44
 */
@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    private int pageSize = 5;

 /*   @RequestMapping("getAll")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")int pn,
                                  Model model){
        PageHelper.startPage(pn,pageSize);

        List<Employee> list = employeeService.selectAll();
        PageInfo<Employee> pageInfo = new PageInfo<Employee>(list,pageSize);
        model.addAttribute("pageInfo",pageInfo);

        return "list";
    } */

    @RequestMapping("getAll")
    @ResponseBody
    public HandleResult getEmps(@RequestParam(value = "pn",defaultValue = "1")int pn){
        PageHelper.startPage(pn,pageSize);

        List<Employee> list = employeeService.selectAll();
        PageInfo<Employee> pageInfo = new PageInfo<Employee>(list,pageSize);
        if (pageInfo != null){
            return new HandleResult(100,"获取成功！").add("pageInfo",pageInfo);
        }else {
            return new HandleResult(200,"获取失败！");
        }

    }

    @PostMapping("emp")
    @ResponseBody
    public HandleResult addEmp(@Valid Employee employee, BindingResult result){

        if (employee==null || employee.getEmpName()==null || employee.getEmail() == null){
            return new HandleResult(200,"用户信息不能为空！");
        }

        if (result.hasErrors()){
            Map<String,String> resultMap = new HashMap<String, String>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError :
                   fieldErrors ) {
                resultMap.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return new HandleResult(300,"添加失败！").add("resultMap",resultMap);
        }

        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmailEqualTo(employee.getEmail());

        if (!employeeService.filedIsValied(example)){
            return new HandleResult(201,"用户邮箱已经存在！");
        }

        int i = employeeService.addEmployee(employee);
        return new HandleResult(100,"新增员工成功！").add("addNum",i);
    }

    @GetMapping("emp/{id}")
    @ResponseBody
    public HandleResult getEmp(@PathVariable("id")int id){
        Employee employee = employeeService.getEmp(id);
        if (employee != null){
            return new HandleResult(100,"查找成功！").add("emp",employee);
        }
        return new HandleResult(200,"查无此人！");
    }

    @PutMapping("emp/{id}")
    @ResponseBody
    public HandleResult updateEmp(Employee employee){
        if (employee==null || employee.getdId()==null){
            return new HandleResult(200,"更新失败！");
        }

        int i = employeeService.updateEmp(employee);
        return new HandleResult(100,"更新成功！");

    }

    @DeleteMapping("emp/{id}")
    @ResponseBody
    public HandleResult deleteEmp(@PathVariable(value = "id",required = false)String id){
      if (id!=null && id.contains(",")){
          String[] split = id.split(",");
          List<Integer> list = new ArrayList<Integer>(split.length);
          for (String s:split
               ) {
              list.add(Integer.valueOf(s));
          }
          employeeService.deleteEmpBatch(list);
          return new HandleResult(100,"成功删除【"+split.length+"】位员工！");
      }else {
          int i = employeeService.deleteEmp(Integer.valueOf(id));
          return new HandleResult(100,"成功删除【"+ id +"】号员工！");
      }

    }
}
