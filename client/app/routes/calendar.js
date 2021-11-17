import Route from '@ember/routing/route';
import { inject as service } from '@ember/service'

export default class CalendarRoute extends Route {
    @service
    apolloService
  
    beforeModel () {}
  
    async model (params) {
      const eventsArr = await this.apolloService.fetchAllEvents()
// Object breaking down a k/v pair of events by date {date: [events...]}
      const finalObj = {}

      eventsArr.forEach(event => {
        const date = event.start.split('T')[0];
        if(finalObj[date]){
          finalObj[date].push(event);
        } else {
          finalObj[date] = [event];
        }
      })
      // console.log(finalObj)
      return finalObj;
    } 
}
