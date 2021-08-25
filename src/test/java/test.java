import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import wzy.bean.Department;
import wzy.bean.Employee;
import wzy.dao.DepartmentMapper;
import wzy.dao.EmployeeMapper;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

/**
 * @author 网中鱼
 * @date 2021/8/22-19:58
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class test {

    public static void main(String[] args) throws Exception {

//        //mybatis的逆向工程代码
//        List<String> warnings = new ArrayList<String>();
//        boolean overwrite = true;
//        File configFile = new File("mbg.xml");
//        ConfigurationParser cp = new ConfigurationParser(warnings);
//        Configuration config = cp.parseConfiguration(configFile);
//        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
//        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
//        myBatisGenerator.generate(null);
    }
//    @Autowired
//    private DepartmentMapper departmentMapper;
//    @Autowired
//    private EmployeeMapper employeeMapper;
//    @Autowired
//    private SqlSession sqlSession;
    @Test
    public void test1(){
//        System.out.println(departmentMapper);

//        departmentMapper.insertSelective(new Department("信息部"));
//        departmentMapper.insertSelective(new Department("测试部"));

//        employeeMapper.insertSelective(new Employee("美琴","女","meiqin@qq.com",1));
//        Employee employee = employeeMapper.selectByPrimaryKeyWithDept(1);
//
//        System.out.println(employee);
//        Random random = new Random();
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//
//        for (int i = 0; i < 1000; i++) {
//            String s = UUID.randomUUID().toString().substring(0, 3);
//            int gender = random.nextInt(100)%2 == 1 ? 1:0;
//            mapper.insertSelective(new Employee(s,gender+"",s+"@qq.com",gender+1));
//        }
//        System.out.println("插入完成");
    }
}
