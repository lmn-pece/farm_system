package org.example.farm_system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.example.farm_system.entity.DictData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 字典数据Mapper接口
 */
public interface DictDataMapper extends BaseMapper<DictData> {
    /**
     * 根据字典类型ID查询字典数据列表
     * @param dictType 字典类型ID
     * @return 字典数据列表
     */
    List<DictData> selectDictDataByType(@Param("dictType") Long dictType);
}
