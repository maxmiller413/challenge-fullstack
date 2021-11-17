import Route from '@ember/routing/route'
import { inject as service } from '@ember/service'

export default class IndexRoute extends Route {
  @service
  apolloService

  beforeModel () {}
// Even need this since have calendar.js?
  async model (params) {
    const model = await this.apolloService.fetchAllEvents()
    // console.log(model)
    return model
  }
}
