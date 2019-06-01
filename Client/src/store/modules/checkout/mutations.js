import {LIST, REMOVEPRODUCT} from './mutation-types'

export default {
    [LIST](state, response) {
        let exists = false;
        state.list.forEach(o => {
            if(o.productId) {
                if(o.productId === response.productId) {
                    exists = true
                }
            }
        })
        if(!exists) {
            state.list.push(response)
        }
    },
    [REMOVEPRODUCT](state, response) {
        state.list.splice(response, 1)
    }
}

