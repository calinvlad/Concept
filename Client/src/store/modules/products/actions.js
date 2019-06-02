import api from "@/plugins/api";
import store from '@/store'
import router from '@/router.js'

export const list = async ({commit}) => {
    const data = (await api().get('/products/list')).data
    commit('LIST', data)
}

export const listById = async ({commit} ) => {
    const data = (await api().get(`/products/${router.currentRoute.params.productId}`)).data
    commit('LISTBYID', data)
}


export default {
    list,
    listById
}