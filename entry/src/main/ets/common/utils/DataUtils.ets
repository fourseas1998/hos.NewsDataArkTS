import {HttpUrl,HttpConstant} from '../constant/Constant';
import {httpRequestGet} from '../utils/HttpUtil'
import {Response} from '../bean/Response'

/**
 * 加载新闻类型
 */
export async function loadNewsTypes(callback){
  let tabBars = [];
  let url = HttpUrl.GET_NEWS_TYPE;
  let response = await httpRequestGet(url,null);
  if(response.code===HttpConstant.HTTP_CODE_200){
    tabBars=response.data;
    callback.onSuccess(tabBars);
  }else{
    callback.onFail(response.msg);
  }
}