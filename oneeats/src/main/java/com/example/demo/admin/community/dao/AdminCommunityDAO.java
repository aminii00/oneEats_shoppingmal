package com.example.demo.admin.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.RecipeVO;

@Mapper
@Repository("adminCommunityDAO")
public interface AdminCommunityDAO {
	public List<RecipeVO> sellectAllRecipe();
}
