import {loadNewsTypes} from '../common/utils/DataUtils';
import {TabBars} from '../common/constant/Constant';

@Component
export default struct TabBar{

  @State tabBarArray:Array<any> = TabBars.DEFAULT_NEWS_TYPES;

  /**
   * 组件初始化时
   */
  aboutToAppear(){
    //加载新闻类型
    loadNewsTypes({
      onSuccess: (value) => this.tabBarArray=value,
      onFail: () => this.tabBarArray=TabBars.DEFAULT_NEWS_TYPES;
    });
  }

  build(){

  }
}