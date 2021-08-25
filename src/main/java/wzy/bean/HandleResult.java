package wzy.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 网中鱼
 * @date 2021/8/23-11:17
 */
public class HandleResult {
    private Integer code;
    private String mes;
    private Map<String,Object> res;

    public HandleResult(Integer code, String mes) {
        this.code = code;
        this.mes = mes;
        this.res = new HashMap<String, Object>();
    }

    public HandleResult add(String key,Object value){
        this.res.put(key,value);
        return this;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public Map<String, Object> getRes() {
        return res;
    }

    public void setRes(Map<String, Object> res) {
        this.res = res;
    }
}
