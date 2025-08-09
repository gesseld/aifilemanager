import React from 'react'
import { describe, it, expect } from 'vitest'
import { render, screen, act } from '@testing-library/react'
import App from '../../frontend/src/App'

describe('App Component', () => {
  it('renders the title', async () => {
    await act(async () => {
      render(<App />)
    })
    expect(screen.getByRole('heading', { name: /AI File Manager/i })).toBeInTheDocument()
  })
})