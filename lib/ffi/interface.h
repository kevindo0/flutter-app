#pragma once

#ifdef __cplusplus
extern "C"{
#endif

enum Role {
	Sender = 0,
	Receiver = 1,
	Invalid
};

enum FileType {
	Bin,
	Csv,
	Unspecified
};

enum ePsiDataType{
	eMpcDataType_kkrt,

	eMpcDataType_MAX,
};

//-----------------------------------

int fetch_number();

void api_cgotest();

typedef struct{
	int m_code;				//1: succ 	0:fail
	char* m_err;		//error
	int m_err_len;
	unsigned long int* m_res;		//out (uint64_t)
	int m_res_size;  	//out
} ApiRes;
// void api_error(char* name);

/**
 * 从文件加载集合数据后进行隐私交求(结果会保存到 params.in+".out" 文件内)
 *
 * @param[in]  psitype input ePsiDataType算法类型 (暂时无用,传0)
 * @param[in]  role input Role (0 - Sender, 1 - Receiver)
 * @param[in] ip_port input ip端口 (127.0.0.1:1212)
 * @param[in] timeout_sec input 连接超时时间(单位秒, -1表示不限制)
 * @param[in] in input data file path(本地路径)
 * @param[in]  bTry input 是否try模式
 * @return Return ApiRes.m_code(true: 成功, 从ApiRes.m_res取结果;  false: 失败,从ApiRes.m_err取错误消息)
 */
ApiRes  api_run_psi_file(
   unsigned char psitype,  //ePsiDataType (暂时无用)
   unsigned char role,  		//Role (0 - Sender, 1 - Receiver)
   char* ip_port, 					 //std::string (127.0.0.1:1212)
	long int timeout_sec,
   char* in,       						 //std::string  (data file path)
	int bTry
);

/**
 * 从内存加载集合数据后进行隐私交求
 *
 * @param[in]  psitype input ePsiDataType算法类型 (暂时无用,传0)
 * @param[in]  role input Role (0 - Sender, 1 - Receiver)
 * @param[in] ip_port input ip端口 (127.0.0.1:1212)
 * @param[in] timeout_sec input 连接超时时间(单位秒, -1表示不限制)
 * @param[in] buffer[] input  vector's buffer address
 * @param[in] num input  vector's buffer num(数组元素个数)
 * @param[in]  bTry input 是否try模式
 * @return Return ApiRes.m_code(true: 成功, 从ApiRes.m_res取结果;  false: 失败,从ApiRes.m_err取错误消息)
 */
ApiRes  api_run_psi_mem(
	char* taskNo,
   unsigned char psitype,  //ePsiDataType (暂时无用)
   unsigned char role,  		//Role (0 - Sender, 1 - Receiver)
   char* ip_port, 					 //std::string (127.0.0.1:1212)
	long int timeout_sec,	  //socket connect timeout (-1:no limit)
   const char* buffer[],       				 // vector's buffer address
	unsigned long int num, 	 //uint64_t
	int bTry
);

//-----------------------------------

// C helper functions:

inline char** makeCharArray(int size) {
	//calloc() 在动态分配完内存后，自动初始化该内存空间为零
        return (char**)calloc(sizeof(char*), size);
}

inline void setArrayString(char ** a, char *s, int n) {
        a[n] = s;
}

inline void freeCharArray(char ** a, int size) {
        int i;
        for (i = 0; i < size; i++)
                free(a[i]);
        free(a);
}

// inline void freeUint64Array(unsigned long int * a, int size) {
//         free(a);
// }

#ifdef __cplusplus
}
#endif
