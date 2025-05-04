import { render, screen } from '@testing-library/react';
import App from './App';

test('this test should fail', () => {
  render(<App />);
  const nonExistingElement = screen.getByText(/this text does not exist/i);
  expect(nonExistingElement).toBeInTheDocument();
});
