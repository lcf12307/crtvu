package com.crtvu.service.implementation;

import com.crtvu.dao.*;
import com.crtvu.dto.CourseOpenInfo;
import com.crtvu.dto.teacher.*;
import com.crtvu.entity.*;
import com.crtvu.service.TeacherGradeService;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by x6012 on 2017/3/23.
 */
@Service
public class TeacherGradeServiceImpl implements TeacherGradeService {

    @Autowired
    private StudentDAO studentDAO;

    @Autowired
    private SelectCourseDAO selectCourseDAO;

    @Autowired
    private TeacherDAO teacherDAO;

    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private TeachCourseDAO teachCourseDAO;

    @Autowired
    private OpenDAO openDAO;

    @Autowired
    private TermYearDAO termYearDAO;

    public String getIsOver(int openId){
        List<TermYearEntity> termYears =termYearDAO.selectAllTerm();
        OpenEntity open = openDAO.selectOpenByOpenId(openId);
        String schoolYear = open.getSchoolYear();
        Date overTime = null;
        int term = open.getTerm();
        for(TermYearEntity temp:termYears){
            if(temp.getSchoolYear().equals(schoolYear)&&temp.getTerm()==term)
                overTime = temp.getOverTime();
        }
        System.out.println(overTime);
        if(overTime==null)
            return "no";
        Date nowData = new Date();
        long chaa = 60*60*24*15*1000; //15天的毫秒数
        long cha = nowData.getTime()-overTime.getTime();
        System.out.println(cha);
        System.out.println();
        if(cha>chaa)
            return "yes";
        else
            return "no";
    }

    public TeacherAllCourse showTeacherAllCourseInfo(int teacherId) {
        TeacherEntity teacherEntity = teacherDAO.selectTeacher(teacherId);
        List<Integer> opens = teachCourseDAO.getAllOpenId(teacherId);
        List<CourseOpenInfo> courseOpenInfoList = new ArrayList<CourseOpenInfo>();
        for(int temp : opens){
            OpenEntity openEntity = openDAO.selectOpenByOpenId(temp);
            String courseId = openEntity.getCourseId();
            CourseEntity courseEntity = courseDAO.selectCourse(courseId);
            CourseOpenInfo courseOpenInfo =new CourseOpenInfo(courseId, openEntity.getOpenId(), courseEntity.getCourseName(), courseEntity.getCredit(),
                    courseEntity.getNature(), courseEntity.getDepartment(), openEntity.getSchoolYear(), openEntity.getTerm(), openEntity.getPeopleNum());
            courseOpenInfoList.add(courseOpenInfo);
            //CourseEntity courseEntity = courseDAO.getCourseInfoByCourseId()
        }

        return new TeacherAllCourse(teacherEntity.getTeacherId(), teacherEntity.getTeacherName(), teacherEntity.getTitle(),courseOpenInfoList);
        //CourseEntity course = courseDAO.getCourseInfoByCourseId(courseId);
    }

    public List<SelectCourseEntity>  queryCourseByOpenid (int openId) {
         return selectCourseDAO.selectGradeByOpenId(openId);
    }

    public List<StuGrade> getStudentGrade(int openId) {
        List<StuGrade> stuGrades = new ArrayList<StuGrade>();
        List<SelectCourseEntity> selectCourseEntities = selectCourseDAO.selectGradeByOpenId(openId);
        for(SelectCourseEntity temp: selectCourseEntities){
            int studentId = temp.getStudentId();
            String stuName = studentDAO.selectStudent(studentId).getStudentName();
            Float grade = temp.getGrade();
            StuGrade stuGrade = new StuGrade(studentId,stuName,openId,grade);
            stuGrades.add(stuGrade);
        }
        return stuGrades;
    }

    public int updateGrade(List<UpdateGrade> updateGradeList) {
        for(UpdateGrade temp:updateGradeList){
            selectCourseDAO.updateGrade(temp.getStudentId(),temp.getOpenId(),temp.getGrade());
        }
        return 1;
    }

    private String buildGradeExcel(List<StudentGradeForDownload> list, String fileName,String type) {

        String path = this.getClass().getResource("/").getPath().replaceFirst("/", "").replaceAll("/WEB-INF/classes/", "");
        //path://C:~/jwgl/target/jwgl/
        //设置目录下的download目录

        //生成表格
        String columnName[]={"学号","姓名","班级","专业","成绩"};

        //创建目录
        String filePath = path + "/download/teacher/";
        File file = new File(filePath);
        if(!file.exists()){
            file.mkdirs();
        }

        HSSFWorkbook book = new HSSFWorkbook();
        // 生成名为“sheet1”的工作表
        HSSFSheet sheet =book.createSheet("sheet1");
        sheet.setDefaultColumnWidth(10);
        //设置学号这列宽为10.
        //sheet.setColumnWidth(0,11);
        //表头导航
        HSSFRow row0 = sheet.createRow(0);
        if(type.equals("grade")) {
            for (int i = 0; i < 5; i++) {
                row0.createCell(i).setCellValue(columnName[i]);
            }
            for(int i=0;i<list.size();i++){
                HSSFRow row = sheet.createRow(i+1);
                row.createCell(0).setCellValue(String.valueOf(list.get(i).getStuId()));
                row.createCell(1).setCellValue(String.valueOf(list.get(i).getStuName()));
                row.createCell(2).setCellValue(String.valueOf(list.get(i).getStuClass()));
                row.createCell(3).setCellValue(String.valueOf(list.get(i).getStuMajor()));
                if(list.get(i).getGrade()==null)
                    row.createCell(4).setCellValue("null");
                else
                    row.createCell(4).setCellValue((float)list.get(i).getGrade());
            }
        }else  if(type.equals("gradeDemo")){
            row0.createCell(0).setCellValue("学号");
            row0.createCell(1).setCellValue("成绩");
            for(int i=0;i<list.size();i++){
                HSSFRow row = sheet.createRow(i+1);
                row.createCell(0).setCellValue(String.valueOf(list.get(i).getStuId()));
                row.createCell(1).setCellValue("");
            }
        }
        FileOutputStream os = null;
        try {
            os = new FileOutputStream(filePath+fileName);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        try {
            book.write(os);
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return fileName;
    }

    public String download(int teacherId,int openId,String type) {
        //需要先判断是否有资格下载
        String fileName;
        if (!teachCourseDAO.getAllOpenId(teacherId).contains(openId))
            return "error";
        else
        {
            //生成文件名称 样式 "高等数学-20170402.xls"
            Date date = new Date();
            SimpleDateFormat df= new SimpleDateFormat("yyyyMMdd");
            String d =df.format(date);
            String courseId = openDAO.selectOpenByOpenId(openId).getCourseId();
            String courseName = courseDAO.selectCourse(courseId).getCourseId();
            if(type.equals("grade"))
                fileName = courseName+"-"+d+".xls";
            else if(type.equals("gradeDemo"))
                fileName = courseName+"-gradeDemo.xls";
            else
                fileName="error";
            //拼接数据
            List<StudentGradeForDownload> list = new ArrayList<StudentGradeForDownload>();
            List<SelectCourseEntity> selectCourseEntityList = selectCourseDAO.selectGradeByOpenId(openId);
            for(SelectCourseEntity temp: selectCourseEntityList){
                int stuId = temp.getStudentId();
                Float grade = temp.getGrade();
                String stuName = studentDAO.selectStudent(stuId).getStudentName();
                String stuClass = studentDAO.selectStudent(stuId).getClassName();
                String stuMajor = studentDAO.selectStudent(stuId).getMajor();
                StudentGradeForDownload tempEntity = new StudentGradeForDownload(stuId,stuName,stuClass,stuMajor,grade);
                list.add(tempEntity);
            }
            String filename = buildGradeExcel(list,fileName,type);
            return filename;
        }


    }

    public Map<String, Object> readNetworkExcel(MultipartFile multipartFile,int openId) throws IOException {
        //检查文件格式是否正确；
        //返回信息初始化
        Map<String,Object> map =new HashMap<String ,Object>();
        List<String> errorList = new ArrayList<String>();

        //把spring文件上传的MultipartFile转换成CommonsMultipartFile类型
        CommonsMultipartFile localFile = (CommonsMultipartFile)multipartFile;
        String path = this.getClass().getResource("/").getPath().replaceFirst("/", "").replaceAll("/WEB-INF/classes/", "")+"/upload";
        //path://C:~/jwgl/target/jwgl/upload
        //创建目录
        File filePath = new File(path);
        if(!filePath.exists()){
            filePath.mkdirs();
        }
        //将上传的文件写入新建的文件中,要判断是.xls或者.xlsx
        String multipartFileName = multipartFile.getOriginalFilename();
        File file = null;
        if(multipartFileName.endsWith(".xls")){
            file = new File(path+"/"+new Date().getTime()+".xls");
        } else{
            file = new File(path+"/"+new Date().getTime()+".xlsx");
        }
        try {
            localFile.getFileItem().write(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<UploadGrade> uploadGradeList = new ArrayList<UploadGrade>();

        InputStream is = new FileInputStream(file);
        Workbook excel = null;
        if(multipartFileName.endsWith(".xls")){
            excel = new HSSFWorkbook(is);
        }


        Sheet sheet = excel.getSheetAt(0);
        //int columns = sheet.getColumns();
        if(sheet.getRow(0).getPhysicalNumberOfCells()==2){
            int i;
            for(i = 1; i<sheet.getPhysicalNumberOfRows();i++){
                Row row = sheet.getRow(i);
                int studentId;
                float grade;
                if(row.getCell(0).getCellType()== Cell.CELL_TYPE_NUMERIC){
                    studentId = (int) row.getCell(0).getNumericCellValue();
                    if((studentId/1000000000)<1||(studentId/1000000000)>10){
                        errorList.add("可能是第"+i+"行第1列:["+row.getCell(0)+"]出现了错误:学号长度错误");
                        continue;
                    }
                } else if(row.getCell(0).getCellType()== Cell.CELL_TYPE_STRING){
                    studentId = Integer.valueOf(row.getCell(0).getStringCellValue());
                    if((studentId/1000000000)<1||(studentId/1000000000)>10){
                        errorList.add("可能是第"+i+"行第1列:["+row.getCell(0)+"]出现了错误：");
                        continue;
                    }
                }
                else {
                    errorList.add("可能是第"+i+"行第1列:["+row.getCell(0)+"]出现了错误：数据类型错误");
                    continue;
                }
                if(row.getCell(1).getCellType()== Cell.CELL_TYPE_NUMERIC){
                    grade = (float) row.getCell(1).getNumericCellValue();
                    if(grade<0||grade>100){
                        errorList.add("可能是第"+i+"行第2列出现了错误：["+row.getCell(1)+"]成绩应在0~100之间");
                        continue;
                    }
                }else {
                    errorList.add("可能是第"+i+"行第2列出现了错误：["+row.getCell(1)+"]数据格式错误");
                    continue;
                }
                UploadGrade uploadGrade = new UploadGrade(studentId,grade);
                uploadGradeList.add(uploadGrade);
            }
        }else {
            String columnsError = "columnsError:可能是列数目不正确，请参考报表格式";
            errorList.add(columnsError);
        }
        //System.out.println(uploadGradeList);
        is.close();
        if(errorList.size()==0) {
            //map.put("uploadList",uploadGradeList);
            List<String> list = uploadCheck(openId,uploadGradeList);
            errorList.addAll(list);
        }
        map.put("errorList",errorList);
        return map;
    }

    private List<String> uploadCheck(int openId,List<UploadGrade> uploadList){
        //检查插入是否满足要求：必须是这个老师的这门课才能插入
        //检查学号是否正确等；
        List<SelectCourseEntity> queryList = selectCourseDAO.selectGradeByOpenId(openId);
        List<Integer> stuIdList = new ArrayList<Integer>();
        for(int i = 0;i<queryList.size();i++){
            stuIdList.add(queryList.get(i).getStudentId());
        }
        List<String> errorList = new ArrayList<String>();
        if(uploadList.size()!=queryList.size()){
            errorList.add("学生人数不正确，请检查你提交的文件");
        }else{
            for(int i=0;i<uploadList.size();i++){
                if(!stuIdList.contains(uploadList.get(i).getStudentId()))
                    errorList.add("该学生不存在您的课程中:"+uploadList.get(i).getStudentId()+",不允许插入");
            }
        }
        if(errorList.size()==0){
            for(int i=0;i<uploadList.size();i++){
                selectCourseDAO.updateGrade(uploadList.get(i).getStudentId(),openId,uploadList.get(i).getGrade());
            }
            errorList.add("OK");
            return errorList;
        }else {
            return errorList;
        }
    }

}
