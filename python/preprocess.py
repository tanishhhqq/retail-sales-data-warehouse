import pandas as pd

# Load raw dataset
sales = pd.read_csv('../data/raw/sales.csv', encoding='latin1')

# Standardize column names
sales.columns = (
    sales.columns
    .str.lower()
    .str.strip()
    .str.replace(' ', '_')
    .str.replace('-', '_')
)

# Remove duplicates
sales.drop_duplicates(inplace=True)

# Convert date columns
sales['order_date'] = pd.to_datetime(sales['order_date'])
sales['ship_date'] = pd.to_datetime(sales['ship_date'])

# Handle missing values
sales.fillna({
    'sales': 0,
    'profit': 0,
    'quantity': 0,
    'discount': 0
}, inplace=True)

# Create additional useful columns
sales['year'] = sales['order_date'].dt.year
sales['month'] = sales['order_date'].dt.month
sales['quarter'] = sales['order_date'].dt.quarter

# Export cleaned dataset
sales.to_csv('../data/processed/clean_sales.csv', index=False)

print('Preprocessing completed successfully.')
print(f'Total rows processed: {len(sales)}')