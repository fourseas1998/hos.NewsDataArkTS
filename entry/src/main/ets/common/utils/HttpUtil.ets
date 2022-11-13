import http from '@ohos.net.http';
import {HttpConstant} from '../constant/Constant'
import {Response} from '../bean/Response';

/**
 * 处理请求的返回数据
 */
function buildResponse(httpResponse:any) : Response{
  //处理返回数据
  let response = new Response();
  httpResponse.then((value) => {
    if(value.responseCode===HttpConstant.HTTP_CODE_200){
      //请求成功
      let result = `${value.result}`;
      let resultJson = JSON.parse(result);
      if(resultJson.code===HttpConstant.SERVER_CODE_SUCCESS){
        response.data=resultJson.data;
      }
      response.code=resultJson.code;
      response.msg=resultJson.msg;
    }else{
      //失败
      response.code=value.responseCode;
      response.msg=`${$r('app.string.http_error_message')}&${value.responseCode}`;
    }
    return response;
  }).catch(() => {
    response.msg = $r('app.string.http_error_message')
    return response;
  })
  return response;
}

/**
 * Get请求
 * @param url 请求地址
 * @param params 请求参数
 */
export function httpRequestGet(url:string, params:any) : Response{
  if(params){
    url=`${url}?${'currentPage'}=${params.currentPage}&${'pageSize'}=${params.pageSize}&${'currentIndex'}=${params.currentIndex}`;
  }

  //创建http对象
  let httpRequest = http.createHttp();
  //发起http请求
  let httpResponse = httpRequest.request(url,{
    method: http.RequestMethod.GET,
    connectTimeout:HttpConstant.HTTP_TIMEOUT,
    readTimeout:HttpConstant.HTTP_TIMEOUT
  });
  return buildResponse(httpResponse);
}

/**
 * Post请求
 * @param url 请求地址
 * @param params 请求参数
 */
export function httpRequestPost(url:string, params:any) : Response{
  //创建http对象
  let httpRequest = http.createHttp();
  //发起http请求
  let httpResponse = httpRequest.request(url,{
    method: http.RequestMethod.POST,
    connectTimeout:HttpConstant.HTTP_TIMEOUT,
    readTimeout:HttpConstant.HTTP_TIMEOUT,
    extraData: params
  });
  return buildResponse(httpResponse);
}