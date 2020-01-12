import { shallowMount } from '@vue/test-utils'
import Loader from '@/component/Loader'

describe('Loader.vue', () => {
  it('renders props.msg when passed', () => {
    const msg = 'new message'
    const wrapper = shallowMount(Loader, {
      propsData: { msg }
    })
    expect(wrapper.text()).toMatch(msg)
  })
})
