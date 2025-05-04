import { render, screen } from '@testing-library/react';
import App from './App';

test('renders welcome text', () => {
  render(<App />);
  const textElement = screen.getByText(/welcome to the static site/i);
  expect(textElement).toBeInTheDocument();
});
