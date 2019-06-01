import {LIST} from './mutation-types'

export default {
    [LIST](state, response) {
        state.list = response.data
    }
}

