package com.core.bank;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
public class FileUploadManager
{
	private Properties form;
	private FileItem item,data;
	private String deposit;
	private String fileName;
	private String fileExtension;
	
	private void setFileName()
	{
		String str=this.fileName;
		String temp="";
		for(int i=str.lastIndexOf("/")+1;i<str.length();i++)
		{
			temp+=str.charAt(i);
		}
		this.fileName=temp.toUpperCase().trim();
		
	}
	private void setFileExtension()
	{
		String str="";
		for(int i=fileName.indexOf(".")+1;i<fileName.length();i++)
		{
			str+=fileName.charAt(i);
		}
		this.fileExtension=str;		
	}
	private void resolve(HttpServletRequest request,File folder)
	{
		form=new Properties();
		try
		{
			this.deposit=folder.getAbsolutePath();
			ServletFileUpload p=new ServletFileUpload(new DiskFileItemFactory(-1,folder));
            List list=p.parseRequest(request);
            Iterator iter = list.iterator();
            while(iter.hasNext())
            {
            		item = (FileItem) iter.next();
                    if(!item.isFormField())
                    {
                    	data=item;
                        fileName=item.getName();
                        this.setFileName();
                        this.setFileExtension();                                       
                    }
                    else
                    {
                    	form.setProperty(item.getFieldName(),item.getString());
                    }
            }
		}
		catch(Exception e)
		{
			form.setProperty("ERROR",e.getMessage());
		}		
	}
	
	public FileUploadManager(HttpServletRequest request,File folderRepository)
	{
		this.resolve(request,folderRepository);
	}
	
	public String getFormValue(String name)
	{
		return form.getProperty(name);
	}
	public String getDepositPath()
	{
		return this.deposit;
	}
	public boolean isExe()
	{
		return this.getFileExtension().equals("EXE");
	}
	public String getFileExtension()
	{
		return this.fileExtension;
	}
	public String getFileName()
	{
		return this.fileName;
	}
	public boolean  save()
	{
		boolean flag=false;
		try
		{
			File file=new File(this.fileName);
			File temp=new File(this.getDepositPath()+"/"+this.getFileName());
			file.renameTo(temp);
			this.data.write(temp);
			flag=temp.exists();
		}
		catch(Exception e){}
		return flag;
	}
	public boolean  save(String name)
	{
		boolean flag=false;
		try
		{
			this.fileName=name+"."+this.fileExtension;
			File file=new File(this.fileName);
			File temp=new File(this.getDepositPath()+"/"+this.fileName);
			file.renameTo(temp);
			this.data.write(temp);
			flag=temp.exists();
		}
		catch(Exception e){}
		return flag;
	}
}
