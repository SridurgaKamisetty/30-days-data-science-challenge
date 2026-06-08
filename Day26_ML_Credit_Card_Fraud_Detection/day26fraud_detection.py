import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report

# Load dataset
df = pd.read_csv("creditcard.csv")

# Basic info
print("Shape:", df.shape)
print("\nClass distribution:")
print(df['Class'].value_counts())

# Fraud vs Normal amount analysis
fraud = df[df['Class']==1]['Amount']
normal = df[df['Class']==0]['Amount']

print("\nFraud transactions:")
print(fraud.describe())

print("\nNormal transactions:")
print(normal.describe())

# Model building
X = df.drop('Class', axis=1)
y = df['Class']

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y)

model = LogisticRegression(class_weight='balanced')
model.fit(X_train, y_train)
y_pred = model.predict(X_test)

# Results
print("\nClassification Report:")
print(classification_report(y_test, y_pred))
